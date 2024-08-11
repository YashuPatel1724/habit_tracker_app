import 'package:flutter/cupertino.dart';
import 'package:habit_tracker_app/modal/app_settings.dart';
import 'package:habit_tracker_app/modal/habit_modal.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class HabitDatabase extends ChangeNotifier {
  static late Isar isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([HabitModalSchema, AppSettingsSchema],
        directory: dir.path);
  }

  Future<void> saveFirstLaunchData() async {
    final existingSettings = await isar.appSettings.where().findFirst();
    if (existingSettings == null) {
      final settings = AppSettings()..firstLaunchDate = DateTime.now();
      await isar.writeTxn(
        () => isar.appSettings.put(settings),
      );
    }
  }

  Future<DateTime?> getFirstLaunchData() async {
    final settings = await isar.appSettings.where().findFirst();
    return settings?.firstLaunchDate;
  }

  final List<HabitModal> currentHabits = [];

  Future<void> addHabit(String habitName) async {
    final newHabit = HabitModal()..name = habitName;
    await isar.writeTxn(
      () => isar.habitModals.put(newHabit),
    );
    readHabits();
  }

  Future<void> readHabits() async {
    List<HabitModal> fetchedHabits = await isar.habitModals.where().findAll();

    currentHabits.clear();
    currentHabits.addAll(fetchedHabits);
    notifyListeners();
  }

  Future<void> updateHabit(int id, bool isCompleted) async {
    final habit = await isar.habitModals.get(id);

    if (habit != null) {
      await isar.writeTxn(
        () async {
          if (isCompleted && !habit.complereDays.contains(DateTime.now())) {
            final today = DateTime.now();

            habit.complereDays
                .add(DateTime(today.year, today.month, today.day));
          } else {
            habit.complereDays.removeWhere(
              (date) =>
                  date.year == DateTime.now().year &&
                  date.month == DateTime.now().month &&
                  date.day == DateTime.now().day,
            );
          }

          await isar.habitModals.put(habit);
        },
      );
    }
    readHabits();
  }

  Future<void> updateHabitName(int id, String newName) async
  {
    final HabitModal? habit = await isar.habitModals.get(id);

    if(habit != null)
      {
        await isar.writeTxn(() async {
          habit.name = newName;
          await isar.habitModals.put(habit);
        },);
      }
    readHabits();
  }

  Future<void> deleteHabit(int id) async
  {
    await isar.writeTxn(() async {
      await isar.habitModals.delete(id);
    },);
    readHabits();
  }
}

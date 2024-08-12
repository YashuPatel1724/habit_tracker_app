import 'package:flutter/material.dart';
import 'package:habit_tracker_app/DataBase/habit_database.dart';
import 'package:habit_tracker_app/compontes/heat_map.dart';
import 'package:habit_tracker_app/compontes/my_habit_tilt.dart';
import 'package:habit_tracker_app/modal/habit_modal.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../../utils/habit_util.dart';

final TextEditingController textController = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initiState() {
    Provider.of<HabitDatabase>(context, listen: false).readHabits();
    super.initState();
  }

  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: InputDecoration(hintText: 'Create a new habit'),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              String newHabitName = textController.text;

              context.read<HabitDatabase>().addHabit(newHabitName);

              Navigator.pop(context);

              textController.clear();
            },
            child: Text('Save'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },
            child: Text('Cancle'),
          )
        ],
      ),
    );
  }

  void checkHabit(bool? value, HabitModal habit) {
    if (value != null) {
      context.read<HabitDatabase>().updateHabit(habit.id, value);
    }
  }

  void editHabit(HabitModal habit) {
    textController.text = habit.name;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              String newHabitName = textController.text;

              context
                  .read<HabitDatabase>()
                  .updateHabitName(habit.id, newHabitName);

              Navigator.pop(context);

              textController.clear();
            },
            child: Text('Save'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },
            child: Text('Cancle'),
          )
        ],
      ),
    );
  }

  void deletHabit(HabitModal habit) {
    textController.text = habit.name;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are sure want to delete?'),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<HabitDatabase>().deleteHabit(habit.id);

              Navigator.pop(context);
            },
            child: Text('Delete'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancle'),
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    ThemeProvider themeProviderTrue =
        Provider.of<ThemeProvider>(context, listen: true);
    ThemeProvider themeProviderFalse =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Home Page',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            Switch(
              value: themeProviderTrue.isDarkMode,
              onChanged: (value) {
                themeProviderFalse.toggleTheme();
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          onPressed: createNewHabit,
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        body: ListView(
          children: [
            _buildHeatMap(),
            _buildHabitList(),
          ],
        ));
  }

  Widget _buildHeatMap() {
    final habitDatabase = context.watch<HabitDatabase>();

    List<HabitModal> currentHabit = habitDatabase.currentHabits;

    return FutureBuilder<DateTime?>(
      future: habitDatabase.getFirstLaunchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HeatMapScreen(
              startDate: snapshot.data!,
              datasets: prepHeatMapDataset(currentHabit));
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildHabitList() {
    final habitDatabase = context.watch<HabitDatabase>();

    List<HabitModal> currentHabits = habitDatabase.currentHabits;

    return ListView.builder(
      itemCount: currentHabits.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final habit = currentHabits[index];
        bool isCompletedToday = isHabitCompletedToday(habit.complereDays);
        return MyHabitTilt(
          isCompled: isCompletedToday,
          text: habit.name,
          onChanged: (value) => checkHabit(value, habit),
          editHabit: (context) => editHabit(habit),
          deleteHabit: (context) => deletHabit(habit),
        );
      },
    );
  }
}

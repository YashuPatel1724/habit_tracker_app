import 'package:habit_tracker_app/modal/habit_modal.dart';

bool isHabitCompletedToday(List<DateTime> completedDays) {
  final today = DateTime.now();
  return completedDays.any((date) =>
      date.year == today.year &&
      date.month == today.month &&
      date.day == today.day);
}

Map<DateTime, int> prepHeatMapDataset(List<HabitModal> habits)
{
  Map<DateTime,int> dataset = {};

  for(var habit in habits)
    {
      for(var date in habit.complereDays)
        {
          final normalizerDate = DateTime(date.year,date.month,date.day);

          if(dataset.containsKey(normalizerDate))
            {
              dataset[normalizerDate] = dataset[normalizerDate]! + 1;
            }
          else
            {
              dataset[normalizerDate] = 1;
            }
        }
    }
  return dataset;
}

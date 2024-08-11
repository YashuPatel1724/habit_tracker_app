import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyHabitTilt extends StatelessWidget {
  final String text;
  final bool isCompled;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext?)? editHabit;
  final void Function(BuildContext?)? deleteHabit;

  const MyHabitTilt(
      {super.key,
      required this.isCompled,
      required this.text,
      required this.onChanged,
      required this.editHabit,
      required this.deleteHabit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: editHabit,
              backgroundColor: Colors.grey.shade800,
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(8),
            ),
            SlidableAction(
              onPressed: deleteHabit,
              backgroundColor: Colors.red,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(8),
            )
          ],
        ),
        child: GestureDetector(
          onTap: () {
            if (onChanged != null) {
              onChanged!(!isCompled);
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: isCompled
                    ? Colors.green
                    : Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(12),
            child: ListTile(
              title: Text(
                text,
                style: TextStyle(
                    color: isCompled
                        ? Colors.white
                        : Theme.of(context).colorScheme.inversePrimary),
              ),
              leading: Checkbox(
                value: isCompled,
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

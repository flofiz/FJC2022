import 'package:time_planner/time_planner.dart';
import 'package:flutter/material.dart';

class Day1 extends StatelessWidget {
  List<TimePlannerTask> tasks = [
    TimePlannerTask(
      // background color for task
      color: Colors.purple,
      // day: Index of header, hour: Task will be begin at this hour
      // minutes: Task will be begin at this minutes
      dateTime: TimePlannerDateTime(day: 0, hour: 14, minutes: 30),
      // Minutes duration of task
      minutesDuration: 90,
      // Days duration of task (use for multi days task)
      daysDuration: 1,
      onTap: () {},
      child: Text(
        'Présentation 1',
        style: TextStyle(color: Colors.grey[350], fontSize: 12),
      ),
    ),
    TimePlannerTask(
      // background color for task
      color: Colors.blue,
      // day: Index of header, hour: Task will be begin at this hour
      // minutes: Task will be begin at this minutes
      dateTime: TimePlannerDateTime(day: 1, hour: 13, minutes: 30),
      // Minutes duration of task
      minutesDuration: 90,
      // Days duration of task (use for multi days task)
      daysDuration: 1,
      onTap: () {},
      child: Text(
        'Présentation 2',
        style: TextStyle(color: Colors.grey[350], fontSize: 12),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planning Jeudi 16 Juin'),
        centerTitle: true,
      ),
      body: Center(
        child: TimePlanner(
          // time will be start at this hour on table
          startHour: 8,
          // time will be end at this hour on table
          endHour: 22,
          // each header is a column and a day
          headers: [
            TimePlannerTitle(
              date: " ",
              title: "Orbigny",
            ),
            TimePlannerTitle(
              date: "",
              title: "Ampère",
            ),
            TimePlannerTitle(
              date: " ",
              title: "Salle R3",
            ),
          ],
          // List of task will be show on the time planner
          tasks: tasks,

          style: TimePlannerStyle(showScrollBar: true),
        ),
      ),
    );
  }
}

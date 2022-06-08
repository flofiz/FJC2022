import 'dart:ffi';

import 'package:csv/csv.dart';
import 'package:fjc_2022/pres.dart';
import 'package:flutter/services.dart';
import 'package:time_planner/time_planner.dart';
import 'package:flutter/material.dart';

class Day1 extends StatelessWidget {
  var _data = <Pres>[];

  void _loadCSV() async {
    var _rawData = await rootBundle.loadString("assets/jeudi16.csv");

    List<List<dynamic>> _listData =
        const CsvToListConverter(fieldDelimiter: ";")
            .convert(_rawData, eol: '\n');
    _listData.removeAt(0);
    for (var item in _listData) {
      _data.add(Pres(
        nom: item[0].toString(),
        prenom: item[1].toString(),
        resume: item[4].toString(),
        titre: item[2].toString(),
        lieu: item[9].toString(),
        debut: item[6].toString(),
        fin: item[7].toString(),
        jour: item[5].toString(),
        type: item[3].toString(),
      ));
    }
  }

  void _addObject() {
    tasks.add(
      TimePlannerTask(
          color: Colors.red,
          dateTime: TimePlannerDateTime(
            day: 0,
            hour: 8,
            minutes: 30,
          ),
          onTap: () {},
          minutesDuration: 30,
          daysDuration: 1),
    );
  }
  // setState(() {’
  //   _data = _data;
  // });

  // List<TimePlannerTask> tasks = [];
  double line = 8.5;

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
    _addObject();
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

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

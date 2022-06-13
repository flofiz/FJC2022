import 'package:csv/csv.dart';
import 'package:fjc_2022/homepage.dart';
import 'package:flutter/services.dart';
import 'package:time_planner/time_planner.dart';
import 'package:flutter/material.dart';
import 'package:fjc_2022/pres.dart';
import 'package:fjc_2022/postersession.dart';
import 'package:fjc_2022/session.dart';
import 'package:fjc_2022/event.dart';
import 'dart:convert';

class Day1 extends StatelessWidget {
  // Liste des tâches qui est appelé par le TimePlanner
  final List<Event> data;
  final int jour;

  Day1({required this.data, required this.jour});

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
          tasks: data,

          style: TimePlannerStyle(showScrollBar: true),
        ),
      ),
    );
  }
}

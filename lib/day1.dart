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

@immutable
class Day1 extends StatelessWidget {
  // Liste des tâches qui est appelé par le TimePlanner
  final List<Event> data;
  final int jour;

  const Day1({Key? key, required this.data, required this.jour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: (jour == 1)
            ? Text('Planning Jeudi 16 Juin')
            : Text('Planning Vendredi 17 Juin'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
                leading: Icon(Icons.input),
                title: Text('Home page'),
                onTap: () => {
                      Navigator.of(context).pop(),
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                    data: data,
                                  )))
                    }),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Day 1'),
              onTap: () => {
                Navigator.of(context).pop(),
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Day1(data: data, jour: 1)))
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Day 2'),
              onTap: () => {
                Navigator.of(context).pop(),
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Day1(data: data, jour: 2)))
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: TimePlanner(
          // time will be start at this hour on table
          startHour: 8,
          // time will be end at this hour on table
          endHour: 22,
          // each header is a column and a day
          headers: [
            const TimePlannerTitle(
              date: " ",
              title: "Orbigny",
            ),
            TimePlannerTitle(
              date: "",
              title: "Ampère",
            ),
            const TimePlannerTitle(
              date: " ",
              title: "Salle R3",
            ),
          ],
          // List of task will be show on the time planner
          tasks: data.where((Event) => Event.jour_pres == jour).toList(),

          style: TimePlannerStyle(showScrollBar: true),
        ),
      ),
    );
  }
}

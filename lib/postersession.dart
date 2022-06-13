import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:fjc_2022/pres.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class PosterPage extends StatelessWidget {
  final String session;
  final List<Pres> to_show;
  PosterPage({Key? key, required this.session, required this.to_show})
      : super(key: key);

  List getPosterSession(to_show) {
    var all_session = [];
    for (var item in to_show) {
      if (!all_session.contains(item.session)) {
        all_session.add(item.session);
      }
    }
    List<Widget> _sessions = [];
    for (var theme in all_session) {
      var new_to_show = to_show
          .where((Pres) => Pres.jour == 1 && Pres.session == theme)
          .toList();
      _sessions.add(Column(
        children: [
          Container(child: Text(theme)),
          Expanded(
            // The ListView
            child: ListView.builder(
              itemCount: new_to_show.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return new_to_show[index];
              },
            ),
          ),
        ],
      ));
    }
    return all_session;
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    var all_sessions = getPosterSession(to_show);

    for (var session in all_sessions) {
      List<Pres> new_to_show = to_show
          .where((Pres) => Pres.session == session && Pres.jour == '1')
          .toList();
      children.add(Text('\n' + session + '\n',
          style: TextStyle(fontWeight: FontWeight.bold)));
      children.add(
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: new_to_show.length,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            return new_to_show[index];
          },
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(session),
        ),
        body: SafeArea(
            child:
                SingleChildScrollView(child: Column(children: [...children]))));
  }
}

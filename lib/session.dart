import 'package:flutter/material.dart';
import 'package:fjc_2022/pres.dart';

class SessionPage extends StatelessWidget {
  final String session;
  final List<Pres> to_show;
  const SessionPage({Key? key, required this.session, required this.to_show})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var oral_to_show = to_show.where((Pres) => Pres.type == "Oral").toList();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(session + ' \n ' + oral_to_show[0].debut,
            textAlign: TextAlign.center),
      ),
      body: ListView.builder(
        itemCount: oral_to_show.length,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return oral_to_show[index];
        },
      ),
    );
  }
}

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:fjc_2022/pres.dart';
import 'package:flutter/services.dart';

class SessionPage extends StatelessWidget {
  final String session;
  final List<Pres> to_show;
  const SessionPage({Key? key, required this.session, required this.to_show})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("buid");
    print(this.to_show);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(session),
      ),
      body: ListView.builder(
        itemCount: to_show.length,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return to_show[index];
        },
      ),
    );
  }
}

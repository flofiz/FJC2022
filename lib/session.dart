import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:fjc_2022/pres.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class SessionPage extends StatefulWidget {
  const SessionPage({Key? key, required this.session}) : super(key: key);
  final String session;
  @override
  State<StatefulWidget> createState() => _SessionPage();
}

class _SessionPage extends State<SessionPage> {
  final Utf8Codec utf8 = Utf8Codec();
  var _data = <Pres>[];
  void showOnTap(session) async {
    var _rawData = await rootBundle.loadString("assets/Tableau_abstract2.csv");
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
        session: item[10].toString(),
      ));
      setState(() {
        _data = _data;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    showOnTap(widget.session);
  }

  @override
  Widget build(BuildContext context) {
    var to_show = _data.where((Pres) => Pres.jour == '1').toList();
    to_show = to_show.where((Pres) => Pres.type == "Oral").toList();

    to_show = to_show.where((Pres) => Pres.session == widget.session).toList();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.session),
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

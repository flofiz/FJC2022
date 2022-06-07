import 'package:fjc_2022/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fjc_2022/pres.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' show utf8;
import 'package:csv/csv.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'FJC2022'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<List<dynamic>> _data = [];
  var _data = <Pres>[];
  void _loadCSV() async {
    var _rawData = await rootBundle.loadString("assets/Tableau_abstract2.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter(fieldDelimiter: ";")
            .convert(_rawData, eol: "\n");
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

  // This function is triggered when the floating button is pressed
  // void _loadCSV() async {
  //   final _rawData = await rootBundle.loadString("assets/data.csv");
  //   List<List<dynamic>> _listData =
  //       const CsvToListConverter().convert(_rawData);
  //   setState(() {
  //     for (var item in _listData)
  //       _data.add(Pres(
  //         nom: item[0].toString(),
  //         prenom: item[1].toString(),
  //         resume: item[2].toString(),
  //         titre: item[3].toString(),
  //         lieu: item[4].toString(),
  //         debut: item[5].toString(),
  //         fin: item[6].toString(),
  //         jour: item[7],
  //       ));
  //     // _data = _listData;
  //   });
  // }
  @override
  void initState() {
    super.initState();
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    _loadCSV();

    var to_show = _data.where((Pres) => Pres.jour == "1").toList();
    to_show = to_show.where((Pres) => Pres.type == "Oral").toList();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      // Menu pour accéder à toutes les différentes pages
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()))
                    }),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Day 1'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Day 2'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Saved'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: to_show.length,
        itemBuilder: (_, index) {
          return to_show[index];
          // return Pres(
          //   nom: _data[index][0].toString(),
          //   prenom: _data[index][1].toString(),
          //   resume: _data[index][2].toString(),
          //   titre: _data[index][3].toString(),
          //   lieu: _data[index][4].toString(),
          //   debut: _data[index][5].toString(),
          //   fin: _data[index][6].toString(),
          //   jour: _data[index][7].toString(),
          // );
        },
      ),
    );
  }
}

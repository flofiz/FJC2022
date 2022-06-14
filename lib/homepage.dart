import 'package:flutter/material.dart';

import 'day1.dart';

class HomePage extends StatelessWidget {
  final data;
  HomePage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page d'acceuil"),
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
              leading: Icon(Icons.verified_user),
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
              leading: Icon(Icons.verified_user),
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
      body: Image.asset('assets/Logo.jpeg'),
    );
  }
}

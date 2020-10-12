import 'package:flutter/material.dart';

import 'login.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        title: Text('Adventures Game', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              MaterialPageRoute route =
                  MaterialPageRoute(builder: (value) => Login());
              Navigator.push(context, route);
            },
          ),
        ],
      ),
    );
  }
}
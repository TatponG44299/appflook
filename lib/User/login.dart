import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'signUP.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showLogo(),
              mySizebox(),
              showtextnameapp(),
              mySizebox(),
              emailFrome(),
              mySizebox(),
              passwordFrome(),
              mySizebox(),
              signIN(),
              showtextsignUp(),
              meSizebox(),
              signUP(),
            ],
          ),
        )),
      ),
    );
  }

  Widget showLogo() {
    return Container(
        width: 130.0, height: 140.0, child: Image.asset('images/Games.png'));
  }

  Widget emailFrome() => Container(
        margin: EdgeInsets.only(left: 50, right: 50),
        child: TextField(
          onChanged: (value) => email = value.trim(),
          decoration: InputDecoration(labelText: 'Email:'),
        ),
      );

  Widget passwordFrome() => Container(
        margin: EdgeInsets.only(left: 50, right: 50),
        child: TextField(
          obscureText: true,
          onChanged: (value) => password = value.trim(),
          decoration: InputDecoration(labelText: 'password:'),
        ),
      );

  mySizebox() => SizedBox(
        width: 8.0,
        height: 20.0,
      );

  meSizebox() => SizedBox(
        width: 8.0,
        height: 15.0,
      );

  Widget signIN() => Center(
        child: Container(
          //margin: EdgeInsets.only(left: 25, right: 25),
          width: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: RaisedButton(
              color: Colors.blue,
              onPressed: () {
                if (email == null ||
                    email.isEmpty ||
                    password == null ||
                    password.isEmpty) {
                  normalDialog(context, 'กรุณากรอกข้อมูลให้ครบ');
                } else {
                  checkEmail();
                }
              },
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
        ),
      );

  Widget showtextsignUp() {
    return Text(
      '_______________________',
      style: TextStyle(fontSize: 28.0, color: Colors.grey),
    );
  }

  Widget showtextnameapp() {
    return Text(
      'Adventures Game',
      style: TextStyle(fontSize: 28.0, color: Colors.blue[700]),
    );
  }

  Widget signUP() => Center(
        child: Container(
          //margin: EdgeInsets.only(left: 25, right: 25),
          width: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: RaisedButton(
              color: Colors.blue,
              onPressed: () {
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (BuildContext context) => Sign());
                Navigator.of(context).pushAndRemoveUntil(
                    materialPageRoute, (Route<dynamic> route) => false);
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
        ),
      );

  Future<void> checkEmail() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((response) {
      //print('Authen Success');
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Home());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }).catchError((response) {
      normalDialog(context, 'ไม่ข้อมูลในระบบ');
    });
  }
}

Future<void> normalDialog(BuildContext context, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(message),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Ok'),
            ),
          ],
        ),
      ],
    ),
  );
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  String email,password,conpassword;
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
              showtext(),
              mySizebox(),
              emailFrome(),
              mySizebox(),
              passwordFrome(),
              mySizebox(),
              conpasswordFrome(),
              mySizebox(),
              signUP(),
            ],
          ),
        )),
      ),
    );
  }

  mySizebox() => SizedBox(
        width: 8.0,
        height: 20.0,
      );

  Widget showtext() {
    return Text(
      'Register',
      style: TextStyle(fontSize: 28.0, color: Colors.blue[700]),
    );
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

  Widget conpasswordFrome() => Container(
        margin: EdgeInsets.only(left: 50, right: 50),
        child: TextField(
          obscureText: true,
          onChanged: (value) => conpassword = value.trim(),
          decoration: InputDecoration(labelText: 'confirm password:'),
        ),
      );

  Widget signUP() => Center(
        child: Container(
          //margin: EdgeInsets.only(left: 25, right: 25),
          width: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: RaisedButton(
              color: Colors.blue,
              onPressed: () {
                if (password == null ||
                        password.isEmpty ||
                        email == null ||
                        email.isEmpty ||
                        conpassword == null ||
                        conpassword.isEmpty) {
                      normalDialog(context, 'กรุณากรอกข้อมูลใหม่'); 
                    } else if (password != conpassword ||
                        conpassword != password &&
                        password.length >= 6) {
                      normalDialog(context, 'Password mismatch.');
                    } else {
                      checksighin(); 
                    }
              },
              child: Text(
                'Sign UP',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
        ),
      );

   Future<void> checksighin() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
      print("Sign up user successful.");
      MaterialPageRoute materialPageRoute =                               
          MaterialPageRoute(builder: (BuildContext context) => Login());  
      Navigator.of(context).pushAndRemoveUntil(                           
          materialPageRoute, (Route<dynamic> route) => false);            
    }).catchError((error) {
      normalDialog(context, 'กรุณากรอกข้อมูลใหม่');
    });
  }
}


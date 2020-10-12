
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'User/login.dart';







void main() async {
  // these 2 lines
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();                  
  //
  runApp(MyApp());
}
//class ตัวนี้ดึง widget ที่มาจาก home มาแสดง
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      //title: '',
      home: Login(),//เริ่มต้นRun
    );
  }
}
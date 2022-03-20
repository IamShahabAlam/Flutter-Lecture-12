import 'package:flutter/material.dart';
import 'package:lect012/api.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Api() ,
      ),
    );
  }
}


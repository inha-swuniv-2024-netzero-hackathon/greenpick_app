// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/MainScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green Pick',
      theme: ThemeData(
        primaryColor: Color(0xFF9CCC65), // 연한 나뭇잎 색상
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MainScreen(),
    );
  }
}
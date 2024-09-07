import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dinasty Kitchen Delivery App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF8F0),
      ),
      home: const Home(), 
    );
  }
}

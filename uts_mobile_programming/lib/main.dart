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
      title: "Ni Hao Chinese Food Delivery",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      //ini tempat buat arahin route nya
      routes: {
        "/": (context) => Home()
      },
    );
  }
}
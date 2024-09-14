import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/pages/login.dart';
import 'package:uts_mobile_programming/pages/detail_menu_screen.dart';
import 'package:uts_mobile_programming/pages/rating.dart';
import 'package:uts_mobile_programming/pages/review.dart';
import 'package:uts_mobile_programming/pages/menu_screen.dart';

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
        routes: {
          '/detailMenu': (context) => DetailMenuScreen(
              menuItem: {'name': 'Example Menu', 'price': '10000'}),
          '/rating': (context) =>
              RatingScreen(menuItem: {'name': 'Example Menu', 'rating': 5}),
          '/review': (context) => ReviewScreen(
              menuItem: {'name': 'Example Menu', 'review': 'Good food!'}),
        },
        home: Login());
  }
}

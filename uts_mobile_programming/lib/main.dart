import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/screen/loading.dart';
import 'package:uts_mobile_programming/screen/detail_menu_screen.dart';

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
          '/detailMenu': (context) => const DetailMenuScreen(menuItem: {
                'name': 'Example Menu',
                'price': '10000',
                'imageURL': 'https://via.placeholder.com/150',
                'rating': 4.5,
                'reviews': 20,
              }),
        },
        home: Loading()
    );
  }
}

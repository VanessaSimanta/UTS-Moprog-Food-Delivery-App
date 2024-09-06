import 'package:flutter/material.dart' hide CarouselController;
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';
import 'package:uts_mobile_programming/widget/drawer_widget.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:uts_mobile_programming/widget/popular_item_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const Drawer(
        child: Drawerwidget(),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CarouselSlider(
              items: [
                'assets/slider1.png',
                'assets/slider2.png',
                'assets/slider3.png'
              ].map((imagePath) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.circular(16), 
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3), 
                      ),
                    ],
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 400,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                viewportFraction: 1,
                enlargeFactor: 0.3,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30, left: 10),
            child: Text("Popular Menu",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
                ),
              ),
            ),
            const PopularItemWidget()
          ],
        ),
      ),
    );
  }
}
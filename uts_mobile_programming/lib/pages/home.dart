import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:uts_mobile_programming/widget/template.dart';
import 'package:uts_mobile_programming/widget/popular_item_widget.dart';
import 'package:uts_mobile_programming/widget/newest_item.dart';
import 'package:uts_mobile_programming/pages/popular_item.dart';
import 'package:uts_mobile_programming/pages/newest_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTemplate(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CarouselSlider(
                items: [
                  'assets/pict1.jpeg',
                  'assets/pict2.jpeg',
                  'assets/pict3.jpeg',
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
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [0, 1, 2].map((index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _current = index;
                      });
                    },
                    child: Container(
                      width: _current == index ? 12.0 : 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? const Color(0xFFFF8811)
                            : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10),
                child: Row(
                  children: [
                    const Text(
                      "Popular Menu",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          // Add your navigation logic here
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PopularItem()), 
                          );
                        },
                        child: const Text(
                          "See All",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.blue, 
                            decoration: TextDecoration.underline, 
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularItemWidget(),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10),
                child: Row(
                  children: [
                    const Text(
                      "Newest Item",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const NewestItem()), 
                          );
                        },
                        child: const Text(
                          "See All",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.blue, 
                            decoration: TextDecoration.underline, 
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const NewestItemWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

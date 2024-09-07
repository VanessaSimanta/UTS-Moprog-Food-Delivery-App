import 'package:flutter/material.dart' hide CarouselController;
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:uts_mobile_programming/widget/popular_item_widget.dart';
import 'package:uts_mobile_programming/widget/newest_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Person',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFFF8811),
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return SafeArea(
          child: SingleChildScrollView(
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
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 10),
                  child: Text(
                    "Popular Menu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const PopularItemWidget(),
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 10),
                  child: Text(
                    "Newest Item",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const NewestItem(),
              ],
            ),
          ),
        );
      case 1:
        // Replace with Business tab content
        return const Center(
          child: Text(
            'Business Tab Content',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        );
      case 2:
        // Replace with School tab content
        return const Center(
          child: Text(
            'School Tab Content',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        );
      default:
        return Container();
    }
  }
}

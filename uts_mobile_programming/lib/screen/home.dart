import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:uts_mobile_programming/screen/menu_screen.dart';
import 'package:uts_mobile_programming/screen/promo_screen.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';
import 'package:uts_mobile_programming/widget/nav_bar.dart';
import 'package:uts_mobile_programming/widget/popular_item_widget.dart';
import 'package:uts_mobile_programming/widget/newest_item.dart';
import 'package:uts_mobile_programming/screen/popular_item.dart';
import 'package:uts_mobile_programming/screen/search.dart';
import 'package:uts_mobile_programming/screen/account.dart';
import 'package:uts_mobile_programming/screen/help_Center.dart';
import 'package:uts_mobile_programming/screen/item_menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePageContent(),
    MenuScreen(),
    const PromotionPage(),
    const Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _currentIndex,
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

 //Function untuk sort item popular based on ratings
  List<Map<String, dynamic>> getPopularItems() {
    List<Map<String, dynamic>> allItems = [
      ...ayamItems,
      ...seafoodItems,
      ...healthItems,
      ...minumanItems,
    ];

    //rating diatas 4.5
    allItems.sort((a, b) => b['rating'].compareTo(a['rating']));
    return allItems.where((item) => item['rating'] >= 4.5).toList();
  }

  //function untuk sort item based on ratings but only 5
  List<Map<String, dynamic>> get5PopularItems() {
    List<Map<String, dynamic>> allItems = [
      ...ayamItems,
      ...seafoodItems,
      ...healthItems,
      ...minumanItems,
    ];

    //rating diatas 4.5
    allItems.sort((a, b) => b['rating'].compareTo(a['rating']));
    return allItems.where((item) => item['rating'] >= 4.5).take(5).toList();
  }

  //function untuk mendapatkan newest item
  List<Map<String, dynamic>> getNewestItems() {
  List<Map<String, dynamic>> allItems = [
    ...ayamItems,
    ...seafoodItems,
    ...healthItems,
    ...minumanItems,
  ];

  allItems.sort((a, b) {
    DateTime dateA = DateTime.parse(a['date']);
    DateTime dateB = DateTime.parse(b['date']);
    return dateB.compareTo(dateA); 
  });

  return allItems.take(5).toList();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showBackArrow: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.help,
              color: Color(0xFFFFF8F0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpCenter()),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Color(0xFFFFF8F0),
            ),
            onPressed: () {
              // Add settings action here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        //CAROUSEL
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CarouselSlider(
              items: [
                'assets/pict1.jpeg',
                'assets/pict2.jpeg',
                'assets/pict3.jpeg',
              ].map((imagePath) {
                return Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.6),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
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
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [0, 1, 2].map((index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 4.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 237, 189, 149)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.orange),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            // Hanya berpindah ke SearchScreen jika sudah mengetik dan menekan enter
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchScreen()),
                            );
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: 'Find Your Favorite Here!',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        style: const TextStyle(color: Colors.black),
                        cursorColor: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //POPULAR MENU
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Row(
                children: [
                  const Text(
                    "Popular Menu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                           MaterialPageRoute(
                            builder: (context) => PopularItem(
                              popularItems: getPopularItems()
                            ),
                           ),
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
            PopularItemWidget(items: get5PopularItems()),

            //NEWEST ITEM
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 10),
              child: Text(
                  "Newest Item",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
               NewestItemWidget(items: getNewestItems()),
            ],
        ),
      ),
    );
  }
}

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

//HOME SCREEN
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
    PromotionPage(),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
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
                      fontSize: 22,
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
                            builder: (context) =>
                                PopularItem(popularItems: getPopularItems()),
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

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          _buildSettingTile(
            context,
            Icons.account_circle,
            'Account Settings',
            const AccountSettingsScreen(),
          ),
          _buildSettingTile(
            context,
            Icons.notifications,
            'Notifications',
            const NotificationSettingsScreen(),
          ),
          _buildSettingTile(
            context,
            Icons.privacy_tip,
            'Privacy',
            const PrivacySettingsScreen(),
          ),
          _buildSettingTile(
            context,
            Icons.color_lens,
            'Theme',
            const ThemeSettingsScreen(),
          ),
          _buildSettingTile(
            context,
            Icons.language,
            'Language',
            const LanguageSettingsScreen(),
          ),
          _buildSettingTile(
            context,
            Icons.storage,
            'Storage',
            const StorageSettingsScreen(),
          ),
          _buildSettingTile(
            context,
            Icons.security,
            'Security',
            const SecuritySettingsScreen(),
          ),
          _buildSettingTile(
            context,
            Icons.help,
            'Help & Support',
            const HelpSettingsScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile(
      BuildContext context, IconData icon, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => screen));
          },
          child: Container(
            height: 60, // Increased height for the button
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(icon, size: 28), // Larger icon size
                const SizedBox(width: 16),
                Expanded(
                    child: Text(title,
                        style:
                            const TextStyle(fontSize: 18))), // Larger text size
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Placeholder screens for individual settings
class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account Settings')),
      body: const Center(child: Text('Account Settings Content')),
    );
  }
}

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification Settings')),
      body: const Center(child: Text('Notification Settings Content')),
    );
  }
}

class PrivacySettingsScreen extends StatelessWidget {
  const PrivacySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Settings')),
      body: const Center(child: Text('Privacy Settings Content')),
    );
  }
}

class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Settings')),
      body: const Center(child: Text('Theme Settings Content')),
    );
  }
}

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language Settings')),
      body: const Center(child: Text('Language Settings Content')),
    );
  }
}

class StorageSettingsScreen extends StatelessWidget {
  const StorageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Storage Settings')),
      body: const Center(child: Text('Storage Settings Content')),
    );
  }
}

class SecuritySettingsScreen extends StatelessWidget {
  const SecuritySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Security Settings')),
      body: const Center(child: Text('Security Settings Content')),
    );
  }
}

class HelpSettingsScreen extends StatelessWidget {
  const HelpSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & Support')),
      body: const Center(child: Text('Help & Support Content')),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';

class MenuItem {
  final String name;
  final String description;
  final double rating;
  final String imageUrl;
  final double price; // Tambahkan properti harga

  MenuItem({
    required this.name,
    required this.description,
    required this.rating,
    required this.imageUrl,
    required this.price, // Tambahkan harga pada konstruktor
  });
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem(
        name: 'Nasi Ayam Telur Asin',
        description: 'Delicious nasi udang with telur asin.',
        rating: 4.8,
        imageUrl: 'assets/search1.jpg',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Cabai Garam',
        description: 'Spicy nasi udang cabai garam.',
        rating: 4.7,
        imageUrl: 'assets/search2.jpg',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Kremes',
        description: 'Nasi udang dengan saus padang khas.',
        rating: 4.6,
        imageUrl: 'assets/search2.jpg',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Bakar',
        description: 'Nasi ayam telur asin yang nikmat.',
        rating: 4.6,
        imageUrl: 'assets/search4.jpg',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Hainan',
        description: 'Fuyunghai dengan saus asam manis.',
        rating: 4.3,
        imageUrl: 'assets/search5.webp',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Lada Hitam',
        description: 'Muntahu lezat dengan bumbu khas.',
        rating: 4.5,
        imageUrl: 'assets/search6.jpg',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Kungpau',
        description: 'Muntahu lezat dengan bumbu khas.',
        rating: 4.2,
        imageUrl: 'assets/search7.jpg',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Sambal Matah',
        description: 'Muntahu lezat dengan bumbu khas.',
        rating: 4.2,
        imageUrl: 'assets/search2.jpg',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Teriyaki',
        description: 'Muntahu lezat dengan bumbu khas.',
        rating: 4.8,
        imageUrl: 'assets/search9.webp',
        price: 23000,
      ),
    ];

    return Scaffold(
      appBar: const AppBarWidget(
        title: Text(
          "Menu",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackArrow: false,
        actions: [],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Box
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.orange),
                      hintText: 'Find Your Favorite Here!',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
          // Menu Items List
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0), // Rounded corners
                    side: BorderSide(color: Colors.orange.withOpacity(0.5), width: 1.0),
                  ),
                  elevation: 5.0,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0), // Rounded corners for image
                      child: Image.asset(
                        item.imageUrl,
                        width: 100,  // Set width sama dengan height
                        height: 100, // Set height sama dengan width untuk jadi kotak
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      item.name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.description),
                        const SizedBox(height: 8.0),
                        Text(
                          'Price: Rp ${item.price.toStringAsFixed(0)}', // Menampilkan harga
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              item.rating.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SearchScreen(),
  ));
}

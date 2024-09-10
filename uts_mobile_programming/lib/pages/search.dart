import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/pages/home.dart';

class MenuItem {
  final String name;
  final String description;
  final double rating;
  final String imageUrl;

  MenuItem({
    required this.name,
    required this.description,
    required this.rating,
    required this.imageUrl,
  });
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem(
        name: 'Nasi Udang Telur Asin',
        description: 'Delicious beef burger with lettuce and cheese.',
        rating: 4.5,
        imageUrl: 'https://asset.kompas.com/crops/yFCpuKxNvIx9uSxfduuOjMeL8a0=/183x185:784x585/750x500/data/photo/2022/05/19/6285d37131c23.jpg',
      ),
      MenuItem(
        name: 'Nasi Udang Cabai Garam',
        description: 'Cheesy pizza with pepperoni and mushrooms.',
        rating: 4.7,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      MenuItem(
        name: 'Nasi Udang Saus Padang',
        description: 'Fresh sushi with tuna and avocado.',
        rating: 4.8,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      MenuItem(
        name: 'Nasi Ayam Telur Asin',
        description: 'Delicious beef burger with lettuce and cheese.',
        rating: 4.5,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      MenuItem(
        name: 'Fuyunghai',
        description: 'Cheesy pizza with pepperoni and mushrooms.',
        rating: 4.7,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      MenuItem(
        name: 'Muntahu',
        description: 'Fresh sushi with tuna and avocado.',
        rating: 4.8,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      MenuItem(
        name: 'Pakcoy',
        description: 'Delicious beef burger with lettuce and cheese.',
        rating: 4.5,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      MenuItem(
        name: 'Dimsum',
        description: 'Cheesy pizza with pepperoni and mushrooms.',
        rating: 4.7,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      MenuItem(
        name: 'Tomyam',
        description: 'Fresh sushi with tuna and avocado.',
        rating: 4.8,
        imageUrl: 'https://via.placeholder.com/150',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.orange,
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
                      prefixIcon: Icon(Icons.search, color: Colors.orange),
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
                      child: Image.network(
                        item.imageUrl,
                        width: 100,
                        height: 400,
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
  runApp(MaterialApp(
    home: SearchScreen(),
  ));
}

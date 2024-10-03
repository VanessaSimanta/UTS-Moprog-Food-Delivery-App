import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';
import 'package:uts_mobile_programming/screen/payment.dart';

class MenuItem {
  final String name;
  final String description;
  final double rating;
  final String imageUrl;
  final int price;

  MenuItem({
    required this.name,
    required this.description,
    required this.rating,
    required this.imageUrl,
    required this.price,
  });
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<MenuItem> cartItems = []; // List to hold cart items
  final NumberFormat currencyFormat = NumberFormat("#,##0", "id_ID");

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem(
        name: 'Nasi Ayam Telur Asin',
        description: 'Nasi dengan potongan ayam yang disajikan dengan bumbu telur asin yang khas.',
        rating: 4.8,
        imageUrl: 'assets/search1.jpg',
        price: 23000,
      ),
      MenuItem(
        name: 'Nasi Ayam Cabai Garam',
        description: 'Nasi dengan potongan ayam yang disajikan dengan bumbu cabai garam yang gurih.',
        rating: 4.7,
        imageUrl: 'assets/search1.jpg',
        price: 23000,
      ),
      // Tambahkan item lainnya sesuai kebutuhan...
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
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.orange.withOpacity(0.5), width: 1.0),
                  ),
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                item.imageUrl,
                                width: 130,
                                height: 130,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    item.description,
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    'Rp. ${currencyFormat.format(item.price)}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 182, 111, 40),
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
                          ],
                        ),
                        const SizedBox(height: 0.0),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  cartItems.add(item);
                                });
                                _showCart(context);
                              },
                              child: const Text('Tambah'),
                            ),
                          ),
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

 void _showCart(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Keranjang Belanja',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            if (cartItems.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Keranjang Anda kosong',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
            else
              ...cartItems.map((item) {
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Rp ${currencyFormat.format(item.price)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      setState(() {
                        cartItems.remove(item); // Hapus item dari keranjang
                      });
                      Navigator.pop(context); // Tutup modal dan buka lagi
                      _showCart(context); // Tampilkan ulang cart dengan item terbaru
                    },
                  ),
                );
              }).toList(),
            if (cartItems.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Logic untuk melanjutkan pembayaran
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(cartItems: cartItems.map((item) {
                          return {
                            'name': item.name,
                            'price': item.price,
                            'rating': item.rating,
                            'description': item.description,
                            'imageUrl': item.imageUrl,
                          };
                        }).toList()),
                      ),
                    );
                  },
                  child: const Text('Lanjutkan ke Pembayaran'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40), // Full width button
                  ),
                ),
              ),
          ],
        ),
      );
    },
  );
}
}
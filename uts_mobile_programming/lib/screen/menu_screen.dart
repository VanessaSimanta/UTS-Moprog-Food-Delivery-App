import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/screen/item_menu.dart';
import 'package:uts_mobile_programming/screen/detail_menu_screen.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobile_programming/models/cart_model.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // List untuk menyimpan item yang ditambahkan ke keranjang
  List<Map<String, dynamic>> cartItems = [];
  // Format untuk harga
  final NumberFormat currencyFormat = NumberFormat("#,##0", "id_ID");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: const Text(
          "Menu",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackArrow: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart,
            color: Color.fromARGB(255, 0, 0, 0),),
            onPressed: () {
              Provider.of<CartModel>(context, listen: false)
                                  .showCart(context); // Tampilkan keranjang jika icon cart di tap
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildCategorySection('Paket Nasi Ayam + Nasi', ayamItems),
          _buildCategorySection('Paket Nasi + Seafood', seafoodItems),
          _buildCategorySection('Paket Nasi Sehat', healthItems),
          _buildCategorySection('Menu Ayam Alacarte', ayamAlacarteItems),
          _buildCategorySection('Minuman', minumanItems),
        ],
      ),
    );
  }

  // Fungsi untuk membuat bagian kategori
  Widget _buildCategorySection(String title, List<Map<String, dynamic>> items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      ListView.builder(
        shrinkWrap: true, 
        physics: const NeverScrollableScrollPhysics(), 
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMenuScreen(menuItem: item),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 8,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.grey[200]!],
                  ),
                ),
                padding: const EdgeInsets.all(12.0),
                height: 176, 
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image section
                    item.containsKey('imageURL')
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              item['imageURL'],
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(Icons.image, size: 110, color: Colors.grey),
                    const SizedBox(width: 30),

                    // Description and rating section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 12),
                          if (item.containsKey('rating'))
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.orange, size: 16),
                                const SizedBox(width: 6),
                                Text(
                                  '${item['rating']} (${item['reviews']}+)',
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          const SizedBox(height: 8),
                          // Row to align price and button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rp ${currencyFormat.format(item['price'])}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              // Add button next to price
                              ElevatedButton(
                                onPressed: () {
                                  Provider.of<CartModel>(context, listen: false)
                                      .addItem(item);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF8811),
                                  foregroundColor: Colors.black,
                                  elevation: 5,
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text('Tambah'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ],
  );
}

}

import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/screen/payment.dart';
import 'package:uts_mobile_programming/screen/item_menu.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';
import 'package:intl/intl.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // List untuk menyimpan item yang ditambahkan ke keranjang
  List<Map<String, dynamic>> cartItems = [];
  //format untuk harga
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
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              _showCart(context); // Tampilkan keranjang jika icon cart di tap
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
          shrinkWrap:
              true, // Menggunakan shrinkWrap untuk membatasi ukuran ListView
          physics:
              const NeverScrollableScrollPhysics(), // Memastikan ListView tidak bisa di-scroll
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 8,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.white, Colors.grey[200]!],
                )),
                padding: const EdgeInsets.all(12.0),
                height: 150,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    item.containsKey('imageURL')
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              item['imageURL'],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(Icons.image,
                            size: 110, color: Colors.grey),
                    const SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: const TextStyle(
                              fontSize: 20, // Increased font size
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 12),
                          if (item.containsKey('rating'))
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.orange, size: 16),
                                const SizedBox(width: 6),
                                Text(
                                  '${item['rating']} (${item['reviews']}+)',
                                  style: const TextStyle(
                                      fontSize: 14), // Adjust font size
                                ),
                              ],
                            ),
                          const SizedBox(height: 8),
                          Text(
                            'Rp. ${currencyFormat.format(item['price'])}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // Check if the item is already in the cart
                          final existingItemIndex = cartItems.indexWhere(
                              (cartItem) => cartItem['name'] == item['name']);
                          if (existingItemIndex != -1) {
                            // If it exists, increment the quantity
                            cartItems[existingItemIndex]['quantity']++;
                          } else {
                            // If it doesn't exist, add it with quantity 1
                            cartItems.add({
                              ...item,
                              'quantity': 1
                            }); // Add a new item with quantity
                          }
                        });
                        _showCart(context);
                      },
                      child: const Text('Tambah'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

//untuk mengembalikan menu dengan rating tertinggi
  List<Map<String, dynamic>> getPopularItems() {
    // Gabungkan semua kategori menjadi satu list
    List<Map<String, dynamic>> allItems = [
      ...ayamItems,
      ...seafoodItems,
      ...healthItems,
      ...minumanItems,
    ];

    // Urutkan berdasarkan rating tertinggi
    allItems.sort((a, b) => b['rating'].compareTo(a['rating']));

    // Ambil hanya item dengan rating di atas 4.5 (misalnya)
    return allItems.where((item) => item['rating'] >= 4.5).toList();
  }

  // Fungsi untuk menampilkan Cart dalam modal bottom sheet
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
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Rp ${currencyFormat.format(item['price'])}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () {
                                  setState(() {
                                    if (item['quantity'] > 1) {
                                      item['quantity']--;
                                    } else {
                                      cartItems.remove(item);
                                    }
                                  });
                                  Navigator.pop(context);
                                  _showCart(context);
                                },
                              ),
                              Text(
                                '${item['quantity']}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () {
                                  setState(() {
                                    item['quantity']++;
                                  });
                                  Navigator.pop(context);
                                  _showCart(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              if (cartItems.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Logic for proceeding to payment
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PaymentPage(cartItems: cartItems),
                        ),
                      );
                    },
                    child: const Text('Lanjutkan ke Pembayaran'),
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          const Size(double.infinity, 40), // Full width button
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

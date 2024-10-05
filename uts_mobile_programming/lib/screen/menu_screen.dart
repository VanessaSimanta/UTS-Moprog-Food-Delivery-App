import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/screen/payment.dart';
import 'package:uts_mobile_programming/screen/item_menu.dart';
import 'package:uts_mobile_programming/screen/detail_menu_screen.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';
import 'package:uts_mobile_programming/models/addson_modal.dart'; // Import Add-ons Modal
import 'package:intl/intl.dart';

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
              return GestureDetector(
                onTap: () {
                  // Navigasi ke detail menu saat item di-tap
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.grey[200]!],
                      ),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    // Batasi tinggi untuk menghindari overflow
                    height:
                        170, // Atau bisa disesuaikan dengan ukuran yang diinginkan
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar item
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

                        // Bagian deskripsi dan rating
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Atur ini sesuai kebutuhan
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
                                    const Icon(Icons.star,
                                        color: Colors.orange, size: 16),
                                    const SizedBox(width: 6),
                                    Text(
                                      '${item['rating']} (${item['reviews']}+)',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              const SizedBox(height: 8),
                              Text(
                                'Rp ${currencyFormat.format(item['price'])}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Tombol tambah
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize
                              .min, // Gunakan mainAxisSize.min di sini
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  final existingItemIndex =
                                      cartItems.indexWhere((cartItem) =>
                                          cartItem['name'] == item['name']);
                                  if (existingItemIndex != -1) {
                                    cartItems[existingItemIndex]['quantity']++;
                                  } else {
                                    cartItems.add({
                                      ...item,
                                      'quantity': 1,
                                    });
                                  }
                                });
                                _showCart(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF8811),
                                foregroundColor: Colors.black,
                                elevation: 5,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
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
                ),
              );
            })
      ],
    );
  }

  // Fungsi untuk menampilkan Cart dalam modal bottom sheet
  void _showCart(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
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
                              // Menampilkan Add-ons jika ada
                              if (item.containsKey('addons') &&
                                  item['addons'].isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: item['addons'].map<Widget>((addOn) {
                                    return Text(
                                      '${addOn['name']} - Rp ${currencyFormat.format(addOn['price'])}',
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    );
                                  }).toList(),
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
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  _showAddOns(
                                      context, item); // Panggil modal Add-ons
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              const SizedBox(height: 16),
              if (cartItems.isNotEmpty)
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PaymentPage(cartItems: cartItems)),
                    );
                  },
                  child: const Text('Lanjutkan Pembayaran'),
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        const Size(double.infinity, 40), // Full width button
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  // Fungsi untuk menampilkan Add-ons modal
  void _showAddOns(BuildContext context, Map<String, dynamic> item) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddOnsModal(
          item: item,
          onAddOnsSelected: (selectedAddOns) {
            setState(() {
              item['addons'] = selectedAddOns;
            });
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/pages/payment.dart';
import 'package:uts_mobile_programming/pages/detail_menu_screen.dart';
import 'package:uts_mobile_programming/pages/item_menu.dart';
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
        title: Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackArrow: false,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
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
          // _buildCategorySection('Menu Ayam Alacarte', ayamAlacarteItems),
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
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap:
              true, // Menggunakan shrinkWrap untuk membatasi ukuran ListView
          physics:
              NeverScrollableScrollPhysics(), // Memastikan ListView tidak bisa di-scroll
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: item.containsKey('imageURL')
                    ? Image.network(
                        item['imageURL'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : Icon(Icons.image, size: 50, color: Colors.grey),
                title: Text(item['name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.containsKey('rating'))
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 16),
                          SizedBox(width: 4),
                          Text('${item['rating']} (${item['reviews']}+)',
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    SizedBox(height: 4),
                    Text('Rp. ${currencyFormat.format(item['price'])}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Tambahkan item ke keranjang
                    setState(() {
                      cartItems.add(item);
                    });
                    // Tampilkan modal Cart
                    _showCart(context);
                  },
                  child: Text('Tambah'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailMenuScreen(menuItem: item),
                    ),
                  );
                },
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
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Keranjang Belanja',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(),
              if (cartItems.isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Keranjang Anda kosong',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              else
                ...cartItems.map((item) {
                  return ListTile(
                    title: Text(item['name']),
                    subtitle: Text('Rp ${item['price']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        setState(() {
                          cartItems.remove(item); // Hapus item dari keranjang
                        });
                        Navigator.pop(context); // Tutup modal dan buka lagi
                        _showCart(
                            context); // Tampilkan ulang cart dengan item terbaru
                      },
                    ),
                  );
                }).toList(),
              if (cartItems.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Logic untuk melanjutkan pembayaran
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PaymentPage(cartItems: cartItems),
                        ),
                      );
                    },
                    child: Text('Lanjutkan ke Pembayaran'),
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(double.infinity, 40), // Full width button
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

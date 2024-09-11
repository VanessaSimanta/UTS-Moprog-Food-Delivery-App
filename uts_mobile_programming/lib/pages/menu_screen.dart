import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/pages/payment.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<Map<String, dynamic>> menuItems = [
    {
      'name': 'Nasi Ayam Telor Asin',
      'price': 23000,
      'rating': 4.8,
      'reviews': 10
    },
    {'name': 'Nasi Ayam Cabai Garam', 'price': 23000, 'popular': true},
    {'name': 'Nasi Ayam Saos Padang', 'price': 23000},
  ];

  // List untuk menyimpan item yang ditambahkan ke keranjang
  List<Map<String, dynamic>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              _showCart(context); // Tampilkan keranjang jika icon cart di tap
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.image, size: 50, color: Colors.grey),
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
                  Text('Rp ${item['price']}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  if (item.containsKey('popular'))
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        'Paling laku',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
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
            ),
          );
        },
      ),
    );
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

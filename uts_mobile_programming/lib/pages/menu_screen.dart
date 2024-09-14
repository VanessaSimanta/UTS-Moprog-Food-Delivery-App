import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/pages/payment.dart';
import 'package:uts_mobile_programming/pages/detail_menu_screen.dart';

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
      'reviews': 30,
      'imageURL':
          'https://i.pinimg.com/originals/a9/bc/12/a9bc12c25fe6ede2fd63bdc84ffa3b1c.jpg'
    },
    {
      'name': 'Nasi Ayam Cabai Garam',
      'price': 23000,
      'rating': 4.7,
      'reviews': 25,
      'imageURL':
          'https://i.pinimg.com/564x/c3/a3/fa/c3a3faaee5d92ad7d77eaaf1b6a14a22.jpg',
    },
    {
      'name': 'Nasi Ayam Kremes',
      'price': 23000,
      'rating': 4.6,
      'reviews': 14,
      'imageURL':
          'https://i.pinimg.com/564x/fe/c3/62/fec3627605cce6567a5526585f09d4ef.jpg',
    },
    {
      'name': 'Nasi Ayam Bakar',
      'price': 23000,
      'rating': 4.6,
      'reviews': 14,
      'imageURL':
          'https://i.pinimg.com/564x/97/56/e7/9756e7ea800f54248683c0ee40b0f3e3.jpg',
    },
    {
      'name': 'Nasi Ayam Hainan',
      'price': 23000,
      'rating': 4.3,
      'reviews': 8,
      //  'imageURL': 'https://i.pinimg.com/736x/4e/80/74/4e80740f4c9bfc01c5e0c26886a975cb.jpg',
    },
    {
      'name': 'Nasi Ayam Lada Hitam',
      'price': 23000,
      'rating': 4.5,
      'reviews': 13,
      //  'imageURL': 'https://i.pinimg.com/564x/9a/17/be/9a17be400d3c37118f73c71ea4b8e42b.jpg',
    },
    {
      'name': 'Nasi Ayam Kungpau',
      'price': 21000,
      'rating': 4.2,
      'reviews': 6,
      //  'imageURL': 'https://i.pinimg.com/564x/54/43/38/54433839d0dbc19d8ece1cf2a045e7f7.jpg',
    },
    {
      'name': 'Nasi Ayam Sambal Matah',
      'price': 20000,
      'rating': 4.2,
      'reviews': 4,
      //  'imageURL': 'https://i.pinimg.com/564x/7c/02/79/7c02792d0b235e9b685a73e4ed0ac161.jpg',
    },
    {
      'name': 'Nasi Ayam Teriyaki',
      'price': 23000,
      'rating': 4.8,
      'reviews': 18,
      //  'imageURL': 'https://i.pinimg.com/564x/ef/04/93/ef049345207584226bd52887e37fa448.jpg',
    },
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(
                16.0), // Menambahkan padding di sekitar tulisan
            child: Text(
              'Paket Nasi Ayam + Nasi',
              style: TextStyle(
                fontSize: 18, // Ukuran teks lebih besar
                fontWeight: FontWeight.bold, // Membuat teks menjadi tebal
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
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
                        Text('Rp ${item['price']}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        if (item.containsKey('popular'))
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              'Paling laku',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailMenuScreen(menuItem: item),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
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

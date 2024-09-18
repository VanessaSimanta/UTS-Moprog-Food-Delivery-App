import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/pages/payment.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<Map<String, dynamic>> ayamItems = [
    //new items for nasi + ayam
    {
      'name': 'Nasi Ayam Telor Asin',
      'price': 23000,
      'rating': 4.8,
      'reviews': 30,
      'imageURL': 'https://i.pinimg.com/originals/a9/bc/12/a9bc12c25fe6ede2fd63bdc84ffa3b1c.jpg'
    },
    {
      'name': 'Nasi Ayam Cabai Garam', 
      'price': 23000, 
      'rating': 4.7,
      'reviews' : 25,
      'imageURL': 'https://i.pinimg.com/564x/c3/a3/fa/c3a3faaee5d92ad7d77eaaf1b6a14a22.jpg',
    },

    {
      'name': 'Nasi Ayam Kremes',
       'price': 23000,
       'rating': 4.6,
       'reviews': 14,
       'imageURL': 'https://i.pinimg.com/564x/fe/c3/62/fec3627605cce6567a5526585f09d4ef.jpg',
       },
    
    {
      'name': 'Nasi Ayam Bakar',
       'price': 23000,
       'rating': 4.6,
       'reviews': 14,
       'imageURL': 'https://i.pinimg.com/564x/97/56/e7/9756e7ea800f54248683c0ee40b0f3e3.jpg',
       },
    {
      'name': 'Nasi Ayam Hainan',
       'price': 23000,
       'rating': 4.3,
       'reviews': 8,
       'imageURL': 'https://i.pinimg.com/736x/4e/80/74/4e80740f4c9bfc01c5e0c26886a975cb.jpg',
       },
    {
      'name': 'Nasi Ayam Lada Hitam',
       'price': 23000,
       'rating': 4.5,
       'reviews': 13,
       'imageURL': 'https://i.pinimg.com/564x/9a/17/be/9a17be400d3c37118f73c71ea4b8e42b.jpg',
       },
    
    {
      'name': 'Nasi Ayam Kungpau',
       'price': 21000,
       'rating': 4.2,
       'reviews': 6,
       'imageURL': 'https://i.pinimg.com/564x/54/43/38/54433839d0dbc19d8ece1cf2a045e7f7.jpg',
       },
    {
      'name': 'Nasi Ayam Sambal Matah',
       'price': 20000,
       'rating': 4.2,
       'reviews': 4,
       'imageURL': 'https://i.pinimg.com/564x/7c/02/79/7c02792d0b235e9b685a73e4ed0ac161.jpg',
       },
    {
      'name': 'Nasi Ayam Teriyaki',
       'price': 23000,
       'rating': 4.8,
       'reviews': 18,
       'imageURL': 'https://i.pinimg.com/564x/ef/04/93/ef049345207584226bd52887e37fa448.jpg',
       },
  ];
       //new items for nasi + seafood
  final List<Map<String, dynamic>> seafoodItems = [    
    {
    'name': 'Nasi Udang Cabai Garam',
    'price': 26000,
    'rating': 4.6,
    'reviews': 12,
    'imageURL': 'https://i.pinimg.com/564x/5f/f3/be/5ff3be89f4fe42a185b1917e2ea5a055.jpg',
  },
  {
    'name': 'Nasi Goreng Udang',
    'price': 26000,
    'rating': 4.4,
    'reviews': 10,
    'imageURL': 'https://i.pinimg.com/564x/43/69/8b/43698b305f75bd8adf5761ba44d62d1c.jpg',
  },
  {
    'name': 'Nasi Udang Saos Balado',
    'price': 26000,
    'rating': 4.3,
    'reviews': 8,
    'imageURL': 'https://i.pinimg.com/564x/07/b1/43/07b1437f922f51e7505bbe639d3797ed.jpg',
  },
  {
    'name': 'Nasi Cumi Sambal Matah',
    'price': 26000,
    'rating': 4.5,
    'reviews': 14,
    'imageURL': 'https://i.pinimg.com/564x/a9/5b/c9/a95bc9761ed960c2cc4d118e7f52255d.jpg',
  },
  {
    'name': 'Nasi Cumi Goreng Tepung',
    'price': 26000,
    'rating': 4.7,
    'reviews': 18,
    'imageURL': 'https://i.pinimg.com/564x/f6/4d/d4/f64dd4b73741eafa8ce4e1637a9592c0.jpg',
  },
  {
    'name': 'Nasi Cumi Saos Padang',
    'price': 26000,
    'rating': 4.6,
    'reviews': 16,
    'imageURL': 'https://i.pinimg.com/564x/f6/4d/d4/f64dd4b73741eafa8ce4e1637a9592c0.jpg',
  },
  {
    'name': 'Nasi Cumi Asam Manis',
    'price': 26000,
    'rating': 4.4,
    'reviews': 11,
    'imageURL': 'https://i.pinimg.com/564x/0e/63/87/0e63871b71163c4e5da3125d937dfd7b.jpg'
  },
  ];

  final List<Map<String, dynamic>> healthItems = [
    {
    'name': 'Nasi FuyungHai',
    'price': 19800,
    'rating': 4.4,
    'reviews': 12,
    'imageURL': 'https://i.pinimg.com/564x/ef/a2/3d/efa23dca770ade3382717ce622f253ac.jpg',
  },
  {
    'name': 'Nasi Chapcai',
    'price': 19800,
    'rating': 4.3,
    'reviews': 11,
    'imageURL': 'https://i.pinimg.com/564x/e7/14/0d/e7140d865438d72045fc67cc3b292d2b.jpg'
  },
  ];  
  
  final List<Map<String, dynamic>> minumanItems = [
     {
    'name': 'Es Teh Manis',
    'price': 5000,
    'rating': 5.0,
    'reviews': 37,
    'imageURL': 'https://i.pinimg.com/564x/0a/7c/27/0a7c27f56aa886c3451e4cf97bc37e57.jpg',
  },
  {
    'name': 'Es Teh Tawar',
    'price': 3000,
    'rating': 4.3,
    'reviews': 11,
    'imageURL': 'https://i.pinimg.com/564x/70/d9/5e/70d95e4a4ff2df1b2d4b100a2d8b3f28.jpg',
  },
  {
    'name': 'Lemon Tea',
    'price': 12000,
    'rating': 4.8,
    'reviews': 20,
    'imageURL': 'https://i.pinimg.com/474x/14/eb/6b/14eb6b6f0557ce5588abe87ae54a90b9.jpg',
  },
  {
    'name': 'Le Minerale',
    'price': 3000,
    'rating': 4.3,
    'reviews': 11,
    'imageURL': 'https://i.pinimg.com/564x/f7/15/62/f71562e1099d6d8a7fa5ba1bcfb6f587.jpg',
  },
  {
    'name': ' Es Jeruk Besar',
    'price': 11000,
    'rating': 4.8,
    'reviews': 23,
    'imageURL': 'https://i.pinimg.com/564x/2f/ce/05/2fce054dc77697bbc790197ed8c71bbf.jpg',
  }, 
  {
    'name': ' Es Jeruk Nipis',
    'price': 8000,
    'rating': 4.3,
    'reviews': 6,
    'imageURL': 'https://i.pinimg.com/564x/e5/c8/2c/e5c82c09694828975a4dc3bae3f05bae.jpg',
  },
  {
    'name': 'Teh Botol',
    'price': 6000,
    'rating': 4.7,
    'reviews': 16,
    'imageURL': ' https://i.pinimg.com/564x/ef/a7/27/efa727a3e6cd732e81084406ea7e7e71.jpg',
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
          shrinkWrap: true, // Menggunakan shrinkWrap untuk membatasi ukuran ListView
          physics: NeverScrollableScrollPhysics(), // Memastikan ListView tidak bisa di-scroll
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
                    Text('Rp ${item['price']}',
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
              ),
            );
          },
        ),
      ],
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

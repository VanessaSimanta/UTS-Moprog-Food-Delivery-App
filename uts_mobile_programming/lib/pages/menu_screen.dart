import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/widget/template.dart';

class MenuScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'name': 'Nasi Ayam Telor Asin', 'price': 23000, 'rating': 4.8, 'reviews': 10},
    {'name': 'Nasi Ayam Cabai Garam', 'price': 23000, 'popular': true},
    {'name': 'Nasi Ayam Saos Padang', 'price': 23000},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTemplate(
      body:
      ListView.builder(
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
                          Text('${item['rating']} (${item['reviews']}+)', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    SizedBox(height: 4),
                    Text('Rp ${item['price']}', style: TextStyle(fontWeight: FontWeight.bold)),
                    if (item.containsKey('popular')) 
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          'Paling laku',
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Tambah action
                  },
                  child: Text('Tambah'),
                ),
              ),
            );
          },
        ),
      );
  }
}

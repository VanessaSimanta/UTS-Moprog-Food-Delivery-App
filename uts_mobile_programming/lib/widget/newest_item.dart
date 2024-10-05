import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/screen/detail_menu_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobile_programming/models/cart_model.dart';

class NewestItemWidget extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const NewestItemWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    // format untuk harga
    final NumberFormat currencyFormat = NumberFormat("#,##0", "id_ID");

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: items.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: GestureDetector(
                onTap: () {
                  // Navigasi ke halaman detail ketika gambar ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailMenuScreen(menuItem: item),
                    ),
                  );
                },
                child: Container(
                  width: 170,
                  height: 300,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8F0),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF9DD9D2).withOpacity(0.5),
                        blurRadius: 8.0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        child: Image.network(
                          item['imageURL'],
                          height: 150,
                          width: 170,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Rp. ${currencyFormat.format(item['price'])}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Text(
                              '${item['rating']}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8), // Jarak antara rating dan tombol
                      Align(
                        alignment: Alignment.centerRight, // Align button to the right
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

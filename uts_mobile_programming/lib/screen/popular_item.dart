import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobile_programming/models/cart_model.dart';

class PopularItem extends StatelessWidget {
  final List<Map<String, dynamic>> popularItems;

  const PopularItem({super.key, required this.popularItems});

  @override
  Widget build(BuildContext context) {
    // format untuk harga
    final NumberFormat currencyFormat = NumberFormat("#,##0", "id_ID");

    return Scaffold(
      appBar: const AppBarWidget(
        title: Text(
          "Popular Menu",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackArrow: true,
        actions: [],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: Column(
              children: popularItems.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Container(
                    width: double.infinity,
                    height:180,
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                          child: Image.network(
                            item['imageURL'],
                            height: 180,
                            width: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  'Rp. ${currencyFormat.format(item['price'])}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    Text(
                                      '${item['rating']}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(width: 4.0),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8), // Jarak antara rating dan tombol
                                Align(
                                  alignment: Alignment.centerRight, // Align button to the right
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

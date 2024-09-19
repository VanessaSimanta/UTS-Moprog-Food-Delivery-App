import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';
import 'package:intl/intl.dart';

class PopularItem extends StatelessWidget {
  final List<Map<String, dynamic>> popularItems;

  const PopularItem({Key? key, required this.popularItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // format untuk harga
    final NumberFormat currencyFormat = NumberFormat("#,##0", "id_ID");

    return Scaffold(
      appBar: AppBarWidget(
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
                    height: 225,
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
                            height: 225, 
                            width: 200, 
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
                                SizedBox(height: 8.0), 
                                Text(
                                  'Rp. ${currencyFormat.format(item['price'])}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 8.0), 
                                Row(
                                  children: [// Space between icon and text
                                    Text(
                                      '${item['rating']}', 
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(width: 4.0),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber, // Change color if needed
                                      size: 20, // Adjust size if needed
                                    ), 
                                  ],
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

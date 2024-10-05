import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uts_mobile_programming/screen/tracking.dart';
import 'package:uts_mobile_programming/models/order.dart';

class ReviewOrderScreen extends StatelessWidget {
  final order; // Data pesanan

  const ReviewOrderScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Order'),
      ),
      body: ListView.builder(
        itemCount: order.items.length, // Berdasarkan jumlah item yang dipesan
        itemBuilder: (context, index) {
          final item = order.items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBar.builder(
                  initialRating: item.rating ?? 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    item.rating = rating; // Simpan rating
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Write a review...',
                  ),
                  onChanged: (value) {
                    item.review = value; // Simpan ulasan
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          // Simpan rating dan review ke database atau backend
          saveReview(order);
        },
      ),
    );
  }

  void saveReview(order) {
    // Implementasi penyimpanan ke server
  }
}

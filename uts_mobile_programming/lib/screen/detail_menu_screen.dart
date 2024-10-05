import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uts_mobile_programming/screen/rating.dart';
import 'package:uts_mobile_programming/screen/review.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';

class DetailMenuScreen extends StatelessWidget {
  final Map<String, dynamic> menuItem;

  const DetailMenuScreen({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat = NumberFormat("#,##0", "id_ID");
    return Scaffold(
      appBar: AppBarWidget(
        title: Text(
          menuItem['name'],
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackArrow: true,
        actions: [],
      ),
      body: SingleChildScrollView(  
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              menuItem['imageURL'],
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              menuItem['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Rp ${currencyFormat.format(menuItem['price'])}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              menuItem['description'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 8),
            Rating(rating: menuItem['rating'], reviewCount: menuItem['reviews']),
            const SizedBox(height: 16),
            const Divider(),
            const Text(
              'User Reviews:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(  // Ganti Expanded dengan SizedBox untuk menentukan tinggi yang fix
              height: 200,  // Sesuaikan tinggi ini
              child: ReviewList(
                reviews: [
                  Review(
                      reviewerName: 'John Doe',
                      reviewText: 'The food was amazing!'),
                  Review(
                      reviewerName: 'Jane Smith',
                      reviewText: 'Great taste and fast delivery.'),
                  // Tambahkan lebih banyak review jika diperlukan
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

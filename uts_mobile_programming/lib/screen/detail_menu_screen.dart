import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/screen/rating.dart';
import 'package:uts_mobile_programming/screen/review.dart';

class DetailMenuScreen extends StatelessWidget {
  final Map<String, dynamic> menuItem;

  const DetailMenuScreen({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuItem['name']),
      ),
      body: Padding(
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
            Text('Rp ${menuItem['price']}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Rating(
                rating: menuItem['rating'], reviewCount: menuItem['reviews']),
            const SizedBox(height: 16),
            const Divider(),
            const Text(
              'User Reviews:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
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

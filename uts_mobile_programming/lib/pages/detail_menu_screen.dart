import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/pages/rating.dart';
import 'package:uts_mobile_programming/pages/review.dart';

class DetailMenuScreen extends StatelessWidget {
  final Map<String, dynamic> menuItem;

  DetailMenuScreen({required this.menuItem});

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
            SizedBox(height: 16),
            Text(
              menuItem['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Rp ${menuItem['price']}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Rating(
                rating: menuItem['rating'], reviewCount: menuItem['reviews']),
            SizedBox(height: 16),
            Divider(),
            Text(
              'User Reviews:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
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

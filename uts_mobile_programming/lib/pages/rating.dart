import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rating;
  final int reviewCount;

  Rating({required this.rating, required this.reviewCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.orange, size: 20),
        SizedBox(width: 4),
        Text(
          '$rating',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 4),
        Text('($reviewCount reviews)'),
      ],
    );
  }
}

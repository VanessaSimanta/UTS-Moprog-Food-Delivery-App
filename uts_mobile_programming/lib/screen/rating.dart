import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rating;
  final int reviewCount;

  const Rating({super.key, required this.rating, required this.reviewCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.orange, size: 20),
        const SizedBox(width: 4),
        Text(
          '$rating',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 4),
        Text('($reviewCount reviews)'),
      ],
    );
  }
}

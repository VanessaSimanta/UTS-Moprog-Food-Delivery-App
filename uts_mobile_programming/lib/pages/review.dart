import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  final Map<String, dynamic> menuItem;

  ReviewScreen({required this.menuItem});

  final List<String> reviews = [
    'Delicious!',
    'The sauce is amazing.',
    'Could be spicier.',
    'Good value for money.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews for ${menuItem['name']}'),
      ),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(reviews[index]),
          );
        },
      ),
    );
  }
}

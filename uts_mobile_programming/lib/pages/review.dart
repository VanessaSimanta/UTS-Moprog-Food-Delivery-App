import 'package:flutter/material.dart';

class Review {
  final String reviewerName;
  final String reviewText;

  Review({required this.reviewerName, required this.reviewText});
}

class ReviewList extends StatelessWidget {
  final List<Review> reviews;

  ReviewList({required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return ListTile(
          leading: Icon(Icons.person),
          title: Text(review.reviewerName),
          subtitle: Text(review.reviewText),
        );
      },
    );
  }
}

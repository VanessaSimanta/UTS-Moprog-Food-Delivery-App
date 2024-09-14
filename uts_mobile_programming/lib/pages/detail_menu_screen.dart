import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/pages/rating.dart';
import 'package:uts_mobile_programming/pages/review.dart';

class DetailMenuScreen extends StatelessWidget {
  final Map<String, dynamic> menuItem;

  DetailMenuScreen({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    double rating = menuItem['rating'];
    int reviews = menuItem['reviews'];
    return Scaffold(
      appBar: AppBar(
        title: Text(menuItem['name']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (menuItem.containsKey('imageURL'))
                Image.network(
                  menuItem['imageURL'],
                  height: 200,
                  fit: BoxFit.cover,
                ),
              SizedBox(height: 16),
              Text(
                menuItem['name'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Rp ${menuItem['price']}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 16),
                  SizedBox(width: 4),
                  Text('$rating (${reviews}+ reviews)'),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Deskripsi menu disini.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RatingScreen(menuItem: menuItem),
                    ),
                  );
                },
                child: Text('Berikan Penilaian (Rating)'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReviewScreen(menuItem: menuItem),
                    ),
                  );
                },
                child: Text('Lihat Ulasan (Reviews)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

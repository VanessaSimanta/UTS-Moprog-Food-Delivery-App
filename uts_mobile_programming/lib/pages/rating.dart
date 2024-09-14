import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  final Map<String, dynamic> menuItem;

  RatingScreen({required this.menuItem});

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _currentRating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate ${widget.menuItem['name']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'How would you rate this menu?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Slider(
              value: _currentRating,
              onChanged: (newRating) {
                setState(() {
                  _currentRating = newRating;
                });
              },
              divisions: 5,
              label: '${_currentRating.toStringAsFixed(1)}',
              min: 0,
              max: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Simpan rating di sini (misal, simpan ke database)
                Navigator.pop(context);
              },
              child: Text('Submit Rating'),
            ),
          ],
        ),
      ),
    );
  }
}

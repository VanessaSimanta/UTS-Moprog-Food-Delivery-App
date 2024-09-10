import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';
import 'package:uts_mobile_programming/widget/nav_bar.dart';
import 'package:uts_mobile_programming/pages/home.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Service'),
        backgroundColor: Colors.orange, // Warna AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Untuk permasalahan dan kebutuhan bisa menghubungi kami melalui kontak dibawah ini:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.orange),
              title: Text('Phone'),
              subtitle: Text('08-123-456-78'),
              onTap: () {
                // Implement phone call functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.orange),
              title: Text('Email'),
              subtitle: Text('helpcenter@gmail.com'),
              onTap: () {
                // Implement email functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.chat, color: Colors.orange),
              title: Text('Live Chat'),
              subtitle: Text('Klik disini untuk melakukan livechat'),
              onTap: () {
                // Implement live chat functionality
              },
            ),
            SizedBox(height: 32.0),
            Text(
              'Feedback Form',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Untuk kritik dan saran serta pertanyaan lebih lanjut bisa mengisi data dibawah ini. Feedback kalian sangat membantu kami untuk terus berkembang!.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your Feedback',
              ),
            ),
            SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              // Implement feedback submission functionality
              },
                child: Text('Submit Feedback'),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Background color
                foregroundColor: Colors.white, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}


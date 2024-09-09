import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: const Color(0xFFFF8811),
      ),
      body: Center(
        child: const Text('MASI DIPIKIRIN ISINYA APA'),
      ),
    );
  }
}
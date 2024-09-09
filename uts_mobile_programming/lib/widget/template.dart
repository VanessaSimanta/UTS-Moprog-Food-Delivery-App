import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';
import 'package:uts_mobile_programming/widget/nav_bar.dart';

class DefaultTemplate extends StatefulWidget {
  final Widget body; // Konten halaman yang berubah-ubah
  const DefaultTemplate({super.key, required this.body});

  @override
  State<DefaultTemplate> createState() => _DefaultTemplateState();
}

class _DefaultTemplateState extends State<DefaultTemplate> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(), // AppBar di bagian atas
      body: SafeArea(child: widget.body), // Body yang bisa diubah-ubah
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ), // BottomNavBar di bagian bawah
    );
  }
}

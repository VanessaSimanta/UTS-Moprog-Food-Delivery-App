import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
      rippleColor: const Color(0xFFFF8811),
      hoverColor: const Color(0xFFF4D06F),
      gap: 1,
      color: const Color(0xFF392F5A),
      activeColor: const Color(0xFFFF8811),
      iconSize: 24,
      tabBackgroundColor: const Color(0xFF9DD9D2).withOpacity(0.1),
      selectedIndex: selectedIndex,
      onTabChange: (index) {
        if (index != selectedIndex) {
          onTabSelected(index);
        }
      },
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.restaurant_menu_outlined,
          text: 'Menu',
        ),
        GButton(
          icon: Icons.discount,
          text: 'Promo',
        ),
        GButton(
          icon: Icons.person,
          text: 'Profile',
        ),
      ],
    );
  }
}


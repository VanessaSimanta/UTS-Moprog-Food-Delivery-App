import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:uts_mobile_programming/pages/home.dart';


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
        onTabSelected(index);
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
            break;
          case 1:
            //
            break;
          default:
            break;
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
          icon: Icons.shopping_cart,
          text: 'Cart',
        ),
        GButton(
          icon: Icons.person,
          text: 'Profile',
        ),
      ],
    );
  }
}

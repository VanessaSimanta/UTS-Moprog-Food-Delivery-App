import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF392F5A), 
      centerTitle: true,
      title: const Text(
        'Dynasty Kitchen Delivery App',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Color(0xFFFFF8F0), 
          letterSpacing: 1.5, 
        ),
      ),
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Color(0xFFFFF8F0), 
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();  
            },
          );
        },
      ),
      actions: <Widget>[
        Stack(
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Color(0xFFFFF8F0),
              ),
              onPressed: () {
                
              },
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.red, 
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(
            Icons.settings,
            color: Color(0xFFFFF8F0), 
          ),
          onPressed: () {
            
          },
        ),
      ],
      elevation: 4, 
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
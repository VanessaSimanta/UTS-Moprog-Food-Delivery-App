import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFF8811), 
      child: Container(
        margin: const EdgeInsets.only(top: 10.0), 
        child: AppBar(
          backgroundColor: const Color(0xFFFF8811), 
          title: const Text(
            'What Would You Like To Eat Today ?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFFFFF8F0), 
              letterSpacing: 1.5,
            ),
          ),
          actions: <Widget>[
            // Stack(
            //   children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.help,
                    color: Color(0xFFFFF8F0), 
                  ),
                  onPressed: () {
                    
                  },
                ),
              //   Positioned(
              //     top: 8,
              //     right: 8,
              //     child: Container(
              //       width: 12,
              //       height: 12,
              //       decoration: const BoxDecoration(
              //         color: Colors.red, 
              //         shape: BoxShape.circle,
              //       ),
              //     ),
              //   ),
              // ],
            //),
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
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10.0); 
}

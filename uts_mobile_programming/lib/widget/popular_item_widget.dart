import 'package:flutter/material.dart';

class PopularItemWidget extends StatelessWidget {
  const PopularItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: [
            for(int i = 0; i < 10; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                width: 170,
                height: 225,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8F0),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow:  [
                    BoxShadow(
                      color: const Color(0xFF9DD9D2).withOpacity(0.5),
                      blurRadius: 8.0,
                      offset: const Offset(0, 4), 
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

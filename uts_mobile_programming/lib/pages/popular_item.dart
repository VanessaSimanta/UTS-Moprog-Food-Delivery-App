import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/widget/template.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SafeArea(
        child : SingleChildScrollView(
          scrollDirection: Axis.vertical, 
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: Column( 
              children: [
                for (int i = 0; i < 10; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7), 
                    child: Container(
                      width: double.infinity, 
                      height: 225,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8F0),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
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
        ),
      ),
    );
  }
}

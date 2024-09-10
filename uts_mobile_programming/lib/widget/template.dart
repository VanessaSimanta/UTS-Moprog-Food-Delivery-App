// import 'package:flutter/material.dart';
// import 'package:uts_mobile_programming/pages/home.dart';
// import 'package:uts_mobile_programming/widget/app_bar_widget.dart';
// import 'package:uts_mobile_programming/widget/nav_bar.dart';

// class DefaultTemplate extends StatefulWidget {
//   final Widget body;
//   const DefaultTemplate({super.key, required this.body});

//   @override
//   State<DefaultTemplate> createState() => _DefaultTemplateState();
// }

// class _DefaultTemplateState extends State<DefaultTemplate> {
//   int _currentIndex = 0;
//   final List<Widget> _pages = [
//     Home(),
//     // Add your other pages here if needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const AppBarWidget(),
//       body: IndexedStack(
//         index: _currentIndex,
//         children: _pages,
//       ),
//       bottomNavigationBar: CustomNavBar(
//         selectedIndex: _currentIndex,
//         onTabSelected: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }

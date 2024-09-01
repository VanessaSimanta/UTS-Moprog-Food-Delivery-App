import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/widget/AppBarWidget.dart';
import 'package:uts_mobile_programming/widget/DrawerWidget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),  
      drawer: Drawer(           
        child: Drawerwidget(),
      ),
      body: SafeArea(
        child: ListView(
        ),
      ),
    );
  }
}

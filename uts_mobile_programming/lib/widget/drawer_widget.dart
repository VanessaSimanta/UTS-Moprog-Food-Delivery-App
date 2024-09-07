import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/pages/home.dart';

class Drawerwidget extends StatelessWidget {
  const Drawerwidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xFFFF8811),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  
            children: [
              CircleAvatar(
                radius: 40,  
                backgroundImage: AssetImage('assets/profile.jpeg'),  
              ),
              SizedBox(height: 10),  
              Text(
                'Your Name',
                style: TextStyle(
                  color: Color(0xFFFFF8F0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,  
            color: Color(0xFFFF8811),  
            size: 30.0,  
          ),
          title: const Text('Home'),  
          onTap: () {
            //buat pindah ke home saat di press
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.person,  
            color: Color(0xFFFF8811),  
            size: 30.0,  
          ),
          title: const Text('My Account'),  
          onTap: () {
            
          },
        ),
        const Divider(color: Colors.black,),
        ListTile(
          leading: const Icon(
            Icons.logout,  
            color: Color(0xFFFF8811),  
            size: 30.0,  
          ),
          title: const Text('LogOut'),  
          onTap: () {
            
          },
        ),
      ],
    );
  }
}

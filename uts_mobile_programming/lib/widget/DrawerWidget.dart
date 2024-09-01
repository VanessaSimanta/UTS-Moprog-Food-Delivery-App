import 'package:flutter/material.dart';

class Drawerwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.red,
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
                  color: Colors.white,
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
            color: Color.fromARGB(255, 255, 136, 0),  
            size: 30.0,  
          ),
          title: const Text('Home'),  
          onTap: () {
            
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.person,  
            color: Color.fromARGB(255, 255, 136, 0),  
            size: 30.0,  
          ),
          title: const Text('My Account'),  
          onTap: () {
            
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,  
            color: Color.fromARGB(255, 255, 136, 0),  
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

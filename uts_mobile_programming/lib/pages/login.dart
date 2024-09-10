import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/loginComponents/my_textfield.dart';

class Login extends StatelessWidget {
  Login({super.key});

  // text controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink.shade100,
        body: SafeArea(
            child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),

              //logo
              Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(
                height: 50,
              ),

              // welcome back
              Text(
                'Welcome Back',
                style: TextStyle(
                  color: Colors.grey[100],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextfield(
                controller: usernameController,
                hintText: 'Username', 
                obscureText: false,
                ),
                const SizedBox(height: 10),
              // pass textfield
              MyTextfield(
                controller: usernameController,
                hintText: 'Username', 
                obscureText: false,
                ),
                const SizedBox(height: 10),
              // forgot pass
              // sign in
              // continue with
            ],
          ),
        )));
  }
}

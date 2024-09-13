import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/loginComponents/my_textfield.dart';
import 'package:uts_mobile_programming/pages/home.dart';

class Login extends StatelessWidget {
  Login({super.key});

  // text controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange.shade400,
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
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),

              // login button
              ElevatedButton(
                onPressed: () {
                  // Pindah ke HomeScreen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
                child: Text('Login'),
              ),
              // forgot pass
              // sign in
              // continue with
            ],
          ),
        )));
  }
}

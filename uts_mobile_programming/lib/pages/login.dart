import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/loginComponents/my_textfield.dart';
import 'package:uts_mobile_programming/pages/home.dart';
import 'package:uts_mobile_programming/pages/register.dart';

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
              const Icon(
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
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                           MaterialPageRoute(
                            builder: (context) => const Register(),
                           ),
                        );
                      },
                      child: const Text(
                        "Don't Have an Account Yet ? Create New Account !",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color.fromARGB(255, 19, 19, 19),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
              // forgot pass
              // sign in
              // continue with
            ],
          ),
        )));
  }
}

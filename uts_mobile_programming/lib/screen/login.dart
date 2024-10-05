import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uts_mobile_programming/models/api_response.dart';
import 'package:uts_mobile_programming/models/user.dart';
import 'package:uts_mobile_programming/screen/home.dart';
import 'package:uts_mobile_programming/screen/register.dart';
import 'package:uts_mobile_programming/services/user_services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // text controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // form key for validation
  final _formKey = GlobalKey<FormState>();

  // Function to handle login
  void _loginUser(BuildContext context) async {
    String email = usernameController.text;
    String password = passwordController.text;

    ApiResponse response = await login(email, password);
    if (response.error == null) {
      _saveAndDirectToHome(response.data as User);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response.error}'),
        ),
      );
    }
  }

  // Function to save token and redirect to Home
  void _saveAndDirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const Home()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade400,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            // Scroll view to handle overflow
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 50),

                    // logo with shadow
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.lock_rounded,
                        size: 100,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // welcome back text with better text hierarchy
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'Please login to your account',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // username textfield with a soft border
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // password textfield
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // login button with a modern look and shadow
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _loginUser(context); // Pass context to the function
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.deepOrangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                          shadowColor: Colors.black.withOpacity(0.2),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // register text with better alignment and padding
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const Register()),
                          (route) => false,
                        );
                      },
                      child: Text(
                        "Don't Have an Account? Register",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20), // Extra padding at the bottom
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

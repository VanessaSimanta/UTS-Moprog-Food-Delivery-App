import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';
import 'package:uts_mobile_programming/pages/home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: Text(
          "Register",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackArrow: false,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                "Create Your Account",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'First Name',
                              icon: Icon(Icons.person),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Last Name',
                              icon: Icon(Icons.person),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        icon: Icon(Icons.person_add),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        icon: Icon(Icons.phone),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: Icon(CupertinoIcons.eye_slash),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(value: true, onChanged: (value) {}),
                        ),
                        const SizedBox(width: 16),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'I agree to the ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text: 'terms',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: ' and ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text: 'conditions',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: '.',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF8811),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 50),
                        ),
                        child: const Text(
                          "CREATE ACCOUNT",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Or sign up with",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            // Handle Google sign up
                          },
                          icon: const Icon(Icons.g_mobiledata),
                          label: const Text("Google"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF9DD9D2), // Customize color
                          ),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Handle Facebook sign up
                          },
                          icon: const Icon(Icons.facebook),
                          label: const Text("Facebook"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF9DD9D2), // Customize color
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

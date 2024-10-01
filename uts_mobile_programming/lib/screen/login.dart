import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uts_mobile_programming/loginComponents/my_textfield.dart';
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50),

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

                // password textfield
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                // login button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _loginUser(context); // Pass context to the function
                    }
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const Register()),
                        (route) => false,
                      );
                    },
                    child: const Text(
                      "Don't Have an Account Yet? Register!",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color.fromARGB(255, 19, 19, 19),
                        decoration: TextDecoration.underline,
                      ),
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

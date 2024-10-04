import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/models/api_response.dart';
import 'package:uts_mobile_programming/screen/home.dart';
import 'package:uts_mobile_programming/services/constant.dart';
import 'package:uts_mobile_programming/services/user_services.dart';
import 'package:uts_mobile_programming/screen/login.dart';

//LOADING SCREEN
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _hasNavigated = false; // biar tidak loop

  void _loadUserInfo() async {
    await Future.delayed(const Duration(seconds: 2));
    String token = await getToken();

    if (_hasNavigated) return; // biar tidak loop

    //token kosong masuk ke login
    if (token == '') {
      _hasNavigated = true; // Mark as navigated
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Login()), (route) => false);
      return;
    }

    //udah ada token langsung ke home
    ApiResponse response = await getUserDetail();

    if (_hasNavigated) return; // biar tidak loop

    if (response.error == null) {
      // kalau tidak ada error, ke home
      _hasNavigated = true;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()), (route) => false);
    } else if (response.error == unathorized) {
      // kalau error masuk ke login
      _hasNavigated = true;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Login()), (route) => false);
    } else {
      // error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.error ?? 'Error')),
      );
    }
  }

  @override
  void initState() {
    _loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
        ),
      ),
    );
  }
}

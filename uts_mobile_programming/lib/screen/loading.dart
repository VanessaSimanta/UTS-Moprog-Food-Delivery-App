import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/models/api_response.dart';
import 'package:uts_mobile_programming/screen/home.dart';
import 'package:uts_mobile_programming/services/constant.dart';
import 'package:uts_mobile_programming/services/user_services.dart';
import 'package:uts_mobile_programming/screen/login.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void _loadUserInfo() async {
  print('Loading user info...');
  await Future.delayed(const Duration(seconds: 2)); 
  String token = await getToken();
  
  if (token == '') {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Login()), 
      (route) => false
    );
  } else {
    ApiResponse response = await getUserDetail();
    if (response.error == null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Home()), 
        (route) => false
      );
    } else if (response.error == unathorized) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login()), 
        (route) => false
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${response.error}')),
      );
    }
  }
}

  @override
  void initState(){
    _loadUserInfo();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
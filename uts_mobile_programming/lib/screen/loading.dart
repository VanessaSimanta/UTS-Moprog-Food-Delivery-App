import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/models/api_response.dart';
import 'package:uts_mobile_programming/screen/home.dart';
import 'package:uts_mobile_programming/services/constant.dart';
import 'package:uts_mobile_programming/services/user_services.dart';
import 'package:uts_mobile_programming/screen/login.dart';

//LOADING SCREEN 
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void _loadUserInfo() async {
  await Future.delayed(const Duration(seconds: 2)); 
  String token = await getToken();
  
  //token kosong masuk ke login
  if (token == '') {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const Login()), 
      (route) => false
    );
    //udah ada token langsung ke home
  } else {
    ApiResponse response = await getUserDetail();
    if (response.error == null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Home()), 
        (route) => false
      );
      //error masuk ke login
    } else if (response.error == unathorized) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Login()), 
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
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
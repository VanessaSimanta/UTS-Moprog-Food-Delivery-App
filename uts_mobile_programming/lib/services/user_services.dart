import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uts_mobile_programming/services/constant.dart';
import 'package:uts_mobile_programming/models/api_response.dart';
import 'package:uts_mobile_programming/models/user.dart';
import 'package:http/http.dart' as http;

//login
Future<ApiResponse> login (String email, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(
      Uri.parse(loginURL),
      headers: {'Accept' : 'application/json'},
      body: {'email': email, 'password': password}
    );
    switch(response.statusCode){
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
      }
    }
    catch(e){
      apiResponse.error = serverError;
    }

    return apiResponse;
}

//register
Future<ApiResponse> register(
    String fname, String lname, String username, String email, String phoneNum, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    print('Registering user: $fname $lname, $username, $email, $phoneNum');
    
    final response = await http.post(
      Uri.parse(registerURL),
      headers: {'Accept': 'application/json'},
      body: {
        'fname': fname,
        'lname': lname,
        'username': username,
        'email': email,
        'phoneNum': phoneNum,
        'password': password,
        'password_confirmation': password
      }
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 201: 
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        print('Validation error: ${apiResponse.error}');
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        print('Authorization error: ${apiResponse.error}');
        break;
      default:
        apiResponse.error = somethingWentWrong;
        print('Unknown error: ${apiResponse.error}');
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
    print('Error occurred: $e');
  }

  return apiResponse;
}

//update user detail (address & DOB)
Future<ApiResponse> updateUserDetails(String address, String dob) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    print('Updating user details: Address: $address, DOB: $dob');

    String token = await getToken();

    final response = await http.put(
      Uri.parse(updateUserDetailsURL),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'address': address,
        'dob': dob,
      })
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    switch (response.statusCode) {
      case 200:
      case 201:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        print('Validation error: ${apiResponse.error}');
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        print('Authorization error: ${apiResponse.error}');
        break;
      default:
        apiResponse.error = somethingWentWrong;
        print('Unknown error: ${apiResponse.error}');
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
    print('Error occurred: $e');
  }

  return apiResponse;
}

//delete account
Future<ApiResponse> deleteAccount() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken(); 
    if (token.isEmpty) {
      apiResponse.error = 'No valid token found. Please log in again.';
      return apiResponse;
    }

    final response = await http.delete(
      Uri.parse(deleteAccountURL),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = 'Account deleted successfully';
        apiResponse.success = true; 
        break;
      case 401:
        apiResponse.error = 'Unauthorized request. Please log in again.';
        break;
      default:
        apiResponse.error = somethingWentWrong; 
        break;
    }
  } catch (e) {
    apiResponse.error = serverError; 
  }
  return apiResponse;
}

//user
Future<ApiResponse> getUserDetail () async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(
      Uri.parse(userURL),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
    switch(response.statusCode){
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 401:
        apiResponse.error = unathorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
      }
    }
    catch(e){
      apiResponse.error = serverError;
    }

    return apiResponse;
}

// get token
Future <String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

// get user id
Future <int>getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}

// logout
Future <bool>logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}


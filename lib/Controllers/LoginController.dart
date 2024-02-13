import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../Screens/BottomNavigator.dart';
import '../Screens/Login_In.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;


  Future<void> LoginAPI() async {
    var apiUrl = 'https://manishtanwar.online/loginApi.php';
    var requestbody = {
      'email': username.value,
      'password': password.value,
    };

    try {
      var response = await post(
        Uri.parse(apiUrl),
        body: requestbody,
      );

      if (response.statusCode == 200) {
        var jsonResponse;
        jsonResponse = json.decode(response.body);

        if (jsonResponse["data"] == "True") {
          print('Login Successfully');
          Get.to(() => MyBottomNaviBar());
        } else {
          print('Login Failed');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during API request: $e');
    }
  }

  late Color myColor;
  late Size mediaSize;

  bool rememberUser = false;

  void changeValue(bool value) {
    rememberUser = value;
    update(); // Notify listeners to rebuild the UI
  }
}

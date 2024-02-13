
import 'dart:convert';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../Screens/Login_In.dart';

class SignupController extends GetxController {
  var name=''.obs;
  var email=''.obs;
  var password=''.obs;
  var mobile=''.obs;


  Future<void> SignupAPI() async {
    var apiUrl = 'https://manishtanwar.online/RegistrationApi.php';
    var requestbody = {
      'name': name.value,
      'email': email.value,
      'password': password.value,
      'mobile': mobile.value
    };

    try {
      var response = await post(
        Uri.parse(apiUrl),
        body: requestbody,
      );

      if (response.statusCode == 200) {
        var jsonResponse;
        jsonResponse = json.decode(response.body);

        if (jsonResponse["status"] == "success") {
          print('Registered Successfully');
          Get.to(() => Login());
        } else {
          print('Registration Failed');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        // Handle the error, e.g., show an error message to the user
      }
    } catch (e) {
      print('Error during API request: $e');
      // Handle the error, e.g., show an error message to the user
    }
  }

  RxBool isObscure = true.obs; // Use RxBool to make it reactive
  void togglePasswordVisibility() {
    isObscure.toggle(); // Toggle the value of isObscure
  }




  late Color myColor;
  late Size mediaSize;

  bool rememberUser = false;

  void changeValue(bool value) {
    rememberUser = value;
    update(); // Notify listeners to rebuild the UI
  }
}

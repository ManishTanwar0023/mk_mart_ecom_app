import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'WelcomeScreen.dart';


class SplashController extends GetxController {
  _navigateToHome() async {
    await Future.delayed(
      const Duration(seconds: 5),
          () => Get.to( WelcomeScreen()),
    );
  }
}

class Splash extends StatelessWidget {
   Splash({super.key});
   SplashController c1 = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    // Call the _navigateToHome method to initiate navigation after a delay
    c1._navigateToHome();


    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/back_blue.png'),fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
              ),
            ),
            Text('Online Shopping Mart',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

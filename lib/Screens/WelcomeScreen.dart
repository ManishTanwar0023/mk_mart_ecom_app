import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'Login_In.dart';
import 'Signup.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/back_orange.png'),fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 60),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: ShapeDecoration(shape: CircleBorder(side: BorderSide(width: 2,color: Colors.cyanAccent),),
                    image: DecorationImage(image: AssetImage('assets/images/logo.png'),fit: BoxFit.cover))
        
                /*BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/logo.png'))),*/
              ),
            ),
            const SizedBox(height: 30,),
            const Text('Welcome MK E-Mart',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28,color: Colors.black),),
            const SizedBox(height: 10,),
            const Text('Please log in or sign in to countinue',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20,color: Colors.black),),
            const SizedBox(height: 60,),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.black38,
                  border: Border.all(width: 3)),
              child: TextButton(onPressed: () {
        
                Get.to(() => Signup());
        
              },
                  child: Text('Sign In', style: TextStyle(fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),)),),
            SizedBox(height: 15,),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.black38,
                  border: Border.all(width: 3)),
              child: TextButton(onPressed: () {
        
                Get.to(() => Login());
        
              },
                  child: Text('Log In', style: TextStyle(fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),)),),
          ],
        ),
      ),

    );
  }
}
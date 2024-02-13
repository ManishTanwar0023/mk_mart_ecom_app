import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mk_mart_ecom_app/Controllers/SignupController.dart';
import 'Login_In.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  SignupController C = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    C.myColor = Theme
        .of(context)
        .primaryColor;
    C.mediaSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/back_yellow.png'),
                  fit: BoxFit.cover),
            ),
            child: Column(children: [
              const SizedBox(height: 20),
              _buildTop(),
              const SizedBox(height: 10),
              Container(margin: EdgeInsets.only(left: 10, right: 10),
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.black38),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          TextField(
                            onChanged: (value) {
                              if (value!.isNotEmpty) {
                                C.name.value = value;
                              }
                            },

                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle,color: Colors.black,),
                              suffixIcon: Icon(Icons.check,color: Colors.black,),
                              label:  Text(
                                'Name',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.yellowAccent,width: 2), // Set the border color when focused
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black,width: 2), // Set the border color when not focused
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextField(
                            onChanged: (value) {
                              if (value!.isNotEmpty) {
                                C.email.value = value;
                              }
                            },

                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail,color: Colors.black,),
                              suffixIcon: Icon(Icons.check,color: Colors.black,),
                              label:  Text(
                                'Email',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.yellowAccent,width: 2), // Set the border color when focused
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black,width: 2), // Set the border color when not focused
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextField(
                            onChanged: (value) {
                              if (value!.isNotEmpty) {
                                C.password.value = value;
                              }
                            },
                            obscureText: C.isObscure.value, // Use c1.isObscure.value to determine visibility
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock,color: Colors.black,),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  C.togglePasswordVisibility(); // Call the toggle method in the controller
                                },
                                icon: Icon(C.isObscure.value ? Icons.visibility : Icons.visibility_off,color: Colors.black,),
                              ),
                              label: Text(
                                'Password',
                                style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.yellowAccent,width: 2), // Set the border color when focused
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black,width: 2), // Set the border color when not focused
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextField(
                            onChanged: (value) {
                              if (value!.isNotEmpty) {
                                C.mobile.value = value;
                              }
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mobile_friendly, color: Colors.black),
                              suffixIcon: Icon(Icons.check, color: Colors.black),
                              label: Text(
                                'Contact',
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.yellowAccent,width: 2), // Set the border color when focused
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black,width: 2), // Set the border color when not focused
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                          _buildRememberForgot(),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              C.SignupAPI();
                              Get.snackbar(
                                'Sign Up Successfully Done',
                                'Name: ${C.name}\n'
                                    'Email: ${C.email}\n'
                                    'Password: ${C.password}\n'
                                    'Mobile: ${C.mobile}',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellowAccent,
                              shape: const StadiumBorder(),
                              elevation: 20,
                              shadowColor: C.myColor,
                              minimumSize: const Size.fromHeight(60),
                            ),
                            child: const Text("SIGN IN", style: TextStyle(color: Colors.black)),
                          ),


                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  )),
              const SizedBox(height: 10),
              Center(child: Text('Or Signup and Login With')),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Tab(icon: Image.asset('assets/images/facebook.png')),
                  Tab(icon: Image.asset('assets/images/github.png')),
                  Tab(icon: Image.asset('assets/images/twitter.png')),
                ],
              ),
            ],),
          ),
        )

    );
  }


  Widget _buildTop() {
    return SizedBox(
      width: C.mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.store_mall_directory,
            size: 80,
            color: Colors.black,
          ),
          Text(
            "MK E-Mart Store",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: 2),
          ),
          Text(
            "Sign Up Here ->> ",
            style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
          Text("Please Signup with your information"),
        ],
      ),
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Checkbox(
              value: C.rememberUser,
              onChanged: (value) {
                C.changeValue(value!);
              },
            ),

            Text("Remember me",style: TextStyle(color: Colors.black),),
          ],
        ),
        TextButton(
            onPressed: () {}, child: Text("Forget Password",style: TextStyle(color: Colors.black),))
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mk_mart_ecom_app/Controllers/LoginController.dart';
import 'package:mk_mart_ecom_app/Controllers/SignupController.dart';
import 'package:sqflite/sqflite.dart';
import '../Controllers/DatabaseManager.dart';
import '../Model/UserModel.dart';
import 'Login_In.dart';

class Login extends StatelessWidget {
  Login({super.key});

  LoginController LC = Get.put(LoginController());

    @override
    Widget build(BuildContext context) {
      LC.myColor = Theme.of(context).primaryColor;
      LC.mediaSize = MediaQuery.of(context).size;

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
                          SizedBox(height: 15),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (value) => LC.username.value = value,
                          ),
                          SizedBox(height: 15),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (value) => LC.password.value = value,
                          ),
                          const SizedBox(height: 20),
                          _buildRememberForgot(),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              LC.LoginAPI();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellowAccent,
                              shape: const StadiumBorder(),
                              elevation: 20,
                              shadowColor: LC.myColor,
                              minimumSize: const Size.fromHeight(60),
                            ),
                            child: const Text("LOG IN",
                              style: TextStyle(color: Colors.black),),
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
      width: LC.mediaSize.width,
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
            "Log In Here ->> ",
            style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
          Text("Please Log-in with your information"),
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
              value: LC.rememberUser,
              onChanged: (value) {
                LC.changeValue(value!);
              },
            ),

            Text("Remember me"),
          ],
        ),
        TextButton(
            onPressed: () {}, child: Text("Forget Password"))
      ],
    );
  }
}
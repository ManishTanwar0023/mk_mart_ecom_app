// import 'dart:convert';
//
// import 'package:firstapp/SelectSubject.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_phone_number_field/flutter_phone_number_field.dart';
// import '../CategoryLangs.dart';
// import '../api/Reg.dart';
// import 'Login&Reg.dart';
//
// class Reg extends StatefulWidget {
//   const Reg({super.key});
//
//   @override
//   State<Reg> createState() => _RegState();
// }
//
// class _RegState extends State<Reg> {
//   final formGlobalKey = GlobalKey<FormState>();
//   final name = TextEditingController();
//   final phoneno = TextEditingController();
//   final email = TextEditingController();
//   final State = TextEditingController();
//   final city = TextEditingController();
//   final pincode = TextEditingController();
//   bool isVerifying = false;
//   List<String> registeredPhoneNumbers = ['1234567890', '9876543210'];
//
//   String? validateName(String value) {
//     if (!value.isNotEmpty || !value[0].toUpperCase().contains(RegExp('[A-Z]'))) {
//       return 'Name must start with a capital letter';
//     }
//     return null;
//   }
//
//   String? validateEmail(String value) {
//     final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$");
//     if (!emailRegex.hasMatch(value)) {
//       return 'Please enter a valid email address';
//     }
//     return null;
//   }
//
//   Future<void> subCategory() async {
//     if (formGlobalKey.currentState!.validate()) {
//       if (!email.text.endsWith("@gmail.com")) {
//         Get.snackbar(
//           backgroundColor: Colors.red[200],
//           colorText: Colors.white,
//           "Invalid Email",
//           "Please enter a valid Gmail address",
//         );
//       } else {
//         final response = await http.post(
//           Uri.parse('https://qwiz15.in/api/create.php'),
//           body: {
//             'name': name.text,
//             'email': email.text,
//             'phone': phoneno.text,
//             'state': State.text,
//             'city': city.text,
//             'pincode': pincode.text,
//           },
//         );
//         if (response.statusCode == 200) {
//           final Map<String, dynamic> data = json.decode(response.body);
//           final status = data['status'];
//
//           if (status == 1) {
//             if (name.text.isEmpty ||
//                 email.text.isEmpty ||
//                 phoneno.text.isEmpty ||
//                 State.text.isEmpty ||
//                 city.text.isEmpty ||
//                 pincode.text.isEmpty) {
//               Get.snackbar(
//                 backgroundColor: Colors.red[200],
//                 colorText: Colors.white,
//                 "Failed To Register",
//                 "Please Fill Complete Form",
//               );
//             } else {
//               Get.to(
//                 fullscreenDialog: true,
//                 duration: Duration(milliseconds: 300),
//                 transition: Transition.fadeIn,
//                 CategoryReg(pass: phoneno.text),
//               );
//               Get.snackbar(
//                 backgroundColor: Colors.red[200],
//                 colorText: Colors.white,
//                 "Register Successfully",
//                 "Now Enter Phone No. For Login",
//               );
//               print(response.body);
//             }
//           } else if (status == 0) {
//             Get.snackbar(
//               backgroundColor: Colors.red[300],
//               colorText: Colors.white,
//               "Mobile Number Exists",
//               "Please use a different phone number",
//             );
//           } else {
//             // Handle other statuses if needed
//             throw Exception('Failed to register: Status $status');
//           }
//         } else {
//           Get.snackbar(
//             backgroundColor: Colors.red[300],
//             colorText: Colors.white,
//             "Failed To Register",
//             "HTTP Status Code: ${response.statusCode}",
//           );
//         }
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Form(
//         key: formGlobalKey,
//         child: Column(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 1,
//               child: Column(
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         height: MediaQuery.of(context).size.height * .27,
//                         width: MediaQuery.of(context).size.width * 1,
//                         decoration: BoxDecoration(
//                             color: Colors.grey.shade200),
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                               left: 8.0, right: 8),
//                           child: Column(
//                             children: [
//                               Image.asset(
//                                 "images/15.png",
//                                 height: MediaQuery.of(context).size.height * .27,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       left: 14.0,
//                       right: 14,
//                       top: 14,
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(height: 10,),
//                         TextFormField(
//                           controller: name,
//                           validator: (value) => validateName(value!),
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 15.0),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.red.shade300),
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(10.0)),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.grey),
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(10.0)),
//                             ),
//                             labelText: 'Name',
//                             labelStyle: TextStyle(
//                                 fontSize: 13.0, color: Colors.grey
//                             ),
//                             prefixIcon: Icon(
//                               Icons.account_circle,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10,),
//                         TextFormField(
//                           controller: email,
//                           validator: (value) => validateEmail(value!),
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 15.0),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.red.shade300),
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(10.0)),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.grey),
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(10.0)),
//                             ),
//                             labelText: 'Email',
//                             labelStyle: TextStyle(
//                                 fontSize: 13.0, color: Colors.grey
//                             ),
//                             prefixIcon: Icon(
//                               Icons.email,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10,),
//                         FlutterPhoneNumberField(
//                           controller: phoneno,
//                           initialCountryCode: "IN",
//                           pickerDialogStyle: PickerDialogStyle(
//                             countryFlagStyle: const TextStyle(
//                                 fontSize: 17),
//                           ),
//                           decoration: InputDecoration(
//                             labelText: 'Phone Number',
//                             labelStyle: TextStyle(
//                                 fontSize: 13.0, color: Colors.grey
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.red.shade300),
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(10.0)),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(12)),
//                               borderSide: BorderSide(
//                                   color: Colors.grey),
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(12)),
//                             ),
//                           ),
//                           languageCode: "en",
//                         ),
//                         SizedBox(height: 10,),
//                         TextFormField(
//                           controller: State,
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 15.0),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.red.shade300),
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(10.0)),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.grey),
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(10.0)),
//                             ),
//                             labelText: 'State',
//                             labelStyle: TextStyle(
//                                 fontSize: 13.0, color: Colors.grey
//                             ),
//                             prefixIcon: Icon(
//                               Icons.flag,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10,),
//                         TextFormField(
//                           controller: city,
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 15.0),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.red.shade300),
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(10.0)),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.grey),
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(10.0)),
//                             ),
//                             labelText: 'Your City',
//                             labelStyle: TextStyle(
//                                 fontSize: 13.0, color: Colors.grey
//                             ),
//                             prefixIcon: Icon(
//                               Icons.location_city_sharp,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10,),
//                         TextFormField(
//                           controller: pincode,
//                           maxLength: 6,
//                           keyboardType: TextInputType.phone,
//                           decoration: InputDecoration(
//                             counterStyle: TextStyle(
//                                 color: Colors.white, fontSize: 1),
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 15.0),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.red.shade300),
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(10.0)),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.grey),
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(10.0)),
//                             ),
//                             labelText: 'Pin Code',
//                             labelStyle: TextStyle(
//                                 fontSize: 13.0, color: Colors.grey
//                             ),
//                             prefixIcon: Icon(
//                               Icons.pin_drop,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * .90,
//                           height: MediaQuery.of(context).size.height * .06,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12)),
//                               primary: Color(0xFFEB3323),
//                               onPrimary: Colors
//                                   .white, // Text Color (Foreground color)
//                             ),
//                             onPressed: subCategory,
//                             child: Text(
//                               "Register",
//                               style: GoogleFonts.poppins(
//                                   fontSize: 26,
//                                   fontWeight: FontWeight.w400),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

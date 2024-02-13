import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../Screens/Cart_Screen.dart';
import '../Screens/Favorite_Screen.dart';
import '../Screens/Home_Screen.dart';
import '../Screens/Profile_Screen.dart';

class BottomController extends GetxController{
  RxInt IndexChanger = 0.obs;

  static final List<Widget> Screens =<Widget>[
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen()
  ];
}
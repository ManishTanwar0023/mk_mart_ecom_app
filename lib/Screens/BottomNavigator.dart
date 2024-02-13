import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../Controllers/BottomNavigationController.dart';

class MyBottomNaviBar extends StatelessWidget {
  MyBottomNaviBar({super.key});

   BottomController b = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => BottomController.Screens[b.IndexChanger.value % BottomController.Screens.length]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.red.withOpacity(0.5))]
        ),
        child: ScaffoldMessenger(child:GNav(
          rippleColor: Colors.black38!,
          hoverColor: Colors.black26!,
          gap: 8,
          activeColor: Colors.white,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.redAccent,
          color: Colors.black,
          tabs: const [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
              iconColor: Colors.blue,  // Change the icon color
              textColor: Colors.blue,  // Change the text color
              backgroundColor: Colors.transparent,  // Change the background color
            ),
            GButton(
              icon: LineIcons.heart,
              text: 'Wishlist',
              iconColor: Colors.green,
              textColor: Colors.green,
              backgroundColor: Colors.transparent,
            ),
            GButton(
              icon: LineIcons.shoppingCart,
              text: 'Cart',
              iconColor: Colors.orange,
              textColor: Colors.orange,
              backgroundColor: Colors.transparent,
            ),
            GButton(
              icon: LineIcons.user,
              text: 'Account',
              iconColor: Colors.purple,
              textColor: Colors.purple,
              backgroundColor: Colors.transparent,
            ),
          ],
          //  selectedIndex: _selectedIndex,
          onTabChange: (index) {
            b.IndexChanger.value = index;
          },
        ),
        ),
      ),
    );
  }
}

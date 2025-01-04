// ignore_for_file: file_names, deprecated_member_use

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/cart_page.dart';
import '../screens/favorite_page.dart';
import '../screens/profile_page.dart';
import '../screens/qr_code_scan.dart';
import 'home_page.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

List<String> bottomNaviLabel = ["Home", "Search", "Cart", "Profile"];
List<IconData> bottomNaviIcon = [
  Icons.home_rounded,
  Icons.favorite,
  Icons.shopping_cart_rounded,
  Icons.person_rounded
];

int currentIndex = 0;
List pages = [
  const HomePage(),
  const FavoritePage(),
  const CartPage(),
  const ProfilePage()
];

class _BottomnavbarState extends State<Bottomnavbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: bottomNaviIcon,
          activeIndex: currentIndex,
          inactiveColor: Colors.black.withOpacity(0.5),
          activeColor: Colors.green,
          gapLocation: GapLocation.center,
          splashColor: Colors.green,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.of(context).push(PageTransition(
              type: PageTransitionType.rightToLeft, child: const QrCodeScan()));
        },
        child: const Icon(
          Icons.qr_code_scanner,
          color: Colors.white,
          size: 30,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: pages[currentIndex],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:product_assessment/features/bottom_navigation_bars/2_search/pages/search_page.dart';
import 'package:product_assessment/utils/utils.dart';
import 'package:product_assessment/features/bottom_navigation_bars/3_camera/pages/camera_page.dart';
import 'package:product_assessment/features/bottom_navigation_bars/1_home/pages/home_page.dart';
import 'package:product_assessment/features/bottom_navigation_bars/5_profile/pages/profile_page.dart';
import 'package:product_assessment/features/bottom_navigation_bars/4_shop/pages/shop_page.dart';

class BottomBarsHandler extends StatefulWidget {
  const BottomBarsHandler({super.key});

  @override
  State<BottomBarsHandler> createState() => _BottomBarsHandler();
}

class _BottomBarsHandler extends State<BottomBarsHandler> {
  int currentIndex = 0;
  List pages = [
    const HomePage(),
    const SearchPage(),
    const CameraPage(),
    const ShopPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topLeft,
        child: pages[currentIndex],
      ),
      bottomNavigationBar: Theme(
          data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: colorFromHex("#A6E4FF"),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.photo_camera), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
            ],
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
          )),
    );
  }
}

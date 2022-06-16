import 'package:boycott_islamophobes/features/home_page.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  final screens = [
    const HomePage(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: FloatingNavbar(
        borderRadius: 15.w,
        itemBorderRadius: 15.w,
        margin: EdgeInsets.symmetric(
          horizontal: 15.h,
          vertical: 10.w,
        ),
        iconSize: 24.w,
        onTap: (int val) {
          setState(() {
            currentIndex = val;
          });
        },
        selectedBackgroundColor: KColors.primary,
        selectedItemColor: Colors.white,
        padding: EdgeInsets.only(
          bottom: 10.h,
          top: 10.h,
          left: 0.w,
          right: 0.w,
        ),
        currentIndex: currentIndex,
        items: [
          FloatingNavbarItem(
            icon: Icons.home,
            // title: 'Home',
          ),
          FloatingNavbarItem(
            icon: Icons.explore,
            // title: 'Explore',
          ),
          FloatingNavbarItem(
            icon: Icons.chat_bubble_outline,
            // title: 'Chats',
          ),
          FloatingNavbarItem(
            icon: Icons.settings,
            // title: 'Settings',
          ),
        ],
      ),
    );
  }
}

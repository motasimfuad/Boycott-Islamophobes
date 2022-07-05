import 'package:boycott_islamophobes/features/faq/presentation/pages/faq_page.dart';
import 'package:boycott_islamophobes/features/home/presentation/pages/home_page.dart';
import 'package:boycott_islamophobes/features/search/presentation/pages/search_page.dart';
import 'package:boycott_islamophobes/features/info/presentation/pages/info_page.dart';
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
    const SearchPage(),
    // router.goNamed(AppRouter.searchPage),
    const FaqPage(),
    const InfoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: FloatingNavbar(
        borderRadius: 20.w,
        itemBorderRadius: 15.w,
        margin: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 15.w,
        ),
        iconSize: 24.w,
        onTap: (int val) {
          setState(() {
            currentIndex = val;
          });
          // if (currentIndex == 1) {
          //   router.pushNamed(AppRouter.searchPage);
          // }
        },
        backgroundColor: Colors.black,
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
          ),
          FloatingNavbarItem(
            icon: Icons.search_rounded,
          ),
          FloatingNavbarItem(
            icon: Icons.question_answer_outlined,
          ),
          // FloatingNavbarItem(
          //   icon: Icons.settings,
          // ),
        ],
      ),
    );
  }
}

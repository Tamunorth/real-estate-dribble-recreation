import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:real_estate_task/pages/base/custom_nav_item.dart';
import 'package:real_estate_task/pages/home/home_page.dart';
import 'package:real_estate_task/pages/search/search_page.dart';
import 'package:real_estate_task/utils/constants.dart';

class BasePage extends StatefulWidget {
  const BasePage({
    super.key,
  });

  @override
  State createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 2;

  void _switchNavPage(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final pages = [
    const SearchPage(),
    const Scaffold(),
    const HomePage(),
    const Scaffold(),
    const Scaffold(),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      extendBody: true,
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(width * 0.15, 0, width * 0.15, 35),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          boxShadow: [
            BoxShadow(
              blurRadius: 55,
              color: Colors.black.withOpacity(0.15),
            ),
            BoxShadow(
              blurRadius: 100,
              color: Colors.black.withOpacity(0.15),
            ),
          ],
          borderRadius: BorderRadius.circular(40),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomNavItem(
            icon: HeroIcons.magnifying_glass,
            index: 0,
            selectedIndex: _selectedIndex,
            onTap: _switchNavPage,
          ),
          CustomNavItem(
            icon: CupertinoIcons.chat_bubble_text_fill,
            index: 1,
            selectedIndex: _selectedIndex,
            onTap: _switchNavPage,
          ),
          CustomNavItem(
            icon: Icons.home_rounded,
            index: 2,
            selectedIndex: _selectedIndex,
            onTap: _switchNavPage,
          ),
          CustomNavItem(
            icon: CupertinoIcons.heart_fill,
            index: 3,
            selectedIndex: _selectedIndex,
            onTap: _switchNavPage,
          ),
          CustomNavItem(
            icon: CupertinoIcons.person_fill,
            index: 4,
            selectedIndex: _selectedIndex,
            onTap: _switchNavPage,
          ),
        ]),
      )
          .animate(
            delay: kDefaultAnimationDuration * 2,
          )
          .slideY(
            begin: 1,
            end: 0,
            curve: kDefaultCurve,
            duration: kDefaultAnimationDuration,
          ),
    );
  }
}

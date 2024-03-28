import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:real_estate_task/pages/home_page.dart';
import 'package:real_estate_task/pages/search_page.dart';
import 'package:real_estate_task/utils/constants.dart';

int _selectedIndex = 2;

class BasePage extends StatefulWidget {
  const BasePage({
    super.key,
    this.passedIndex = 0,
  });

  final int passedIndex;

  @override
  State createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  void initState() {
    // TODO: implement initState
    _selectedIndex = widget.passedIndex;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Visibility(visible: _selectedIndex == 0, child: const SearchPage()),
          const Scaffold(),
          const HomePage(),
          const Scaffold(),
          const Scaffold(),
        ],
      ),
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
            onTap: () {
              setState(() {
                _selectedIndex = 0;
              });
            },
          ),
          CustomNavItem(
            icon: CupertinoIcons.chat_bubble_text_fill,
            index: 1,
            selectedIndex: _selectedIndex,
            onTap: () {
              setState(() {
                _selectedIndex = 1;
              });
            },
          ),
          CustomNavItem(
            icon: Icons.home_rounded,
            index: 2,
            selectedIndex: _selectedIndex,
            onTap: () {
              setState(() {
                _selectedIndex = 2;
              });
            },
          ),
          CustomNavItem(
            icon: CupertinoIcons.heart_fill,
            index: 3,
            selectedIndex: _selectedIndex,
            onTap: () {
              setState(() {
                _selectedIndex = 3;
              });
            },
          ),
          CustomNavItem(
            icon: CupertinoIcons.person_fill,
            index: 4,
            selectedIndex: _selectedIndex,
            onTap: () {
              setState(() {
                _selectedIndex = 4;
              });
            },
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

class CustomNavItem extends StatelessWidget {
  const CustomNavItem({
    super.key,
    required this.index,
    required this.onTap,
    required this.selectedIndex,
    required this.icon,
  });

  final int index;
  final int selectedIndex;
  final VoidCallback onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: index == selectedIndex
              ? Theme.of(context).colorScheme.primary
              : Colors.black,
          shape: BoxShape.circle,
        ),
        child: Icon(icon),
      ),
    );
  }
}

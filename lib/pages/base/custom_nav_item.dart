import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:real_estate_task/pages/home/home_page.dart';
import 'package:real_estate_task/pages/search/search_page.dart';
import 'package:real_estate_task/utils/constants.dart';

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
  final ValueChanged<int> onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call(index);
      },
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

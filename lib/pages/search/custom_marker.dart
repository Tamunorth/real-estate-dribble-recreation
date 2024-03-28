import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:real_estate_task/utils/constants.dart';

class CustomMarker extends StatelessWidget {
  const CustomMarker({
    super.key,
    required this.isPrice,
  });

  final bool isPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 500),
        alignment: Alignment.centerLeft,
        child: Builder(builder: (context) {
          if (isPrice) {
            return Text(
              '13,3 mm P',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            );
          } else {
            return const Icon(Icons.house_siding_sharp);
          }
        }).animate().fade(
              delay: (kDefaultAnimationDuration * 2),
              duration: kDefaultAnimationDuration,
            ),
      ),
    ).animate().scale(
          delay: kDefaultAnimationDuration,
          duration: kDefaultAnimationDuration,
          alignment: Alignment.bottomLeft,
        );
  }
}

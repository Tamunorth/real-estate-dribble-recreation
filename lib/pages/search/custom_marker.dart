import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:real_estate_task/utils/constants.dart';
import 'package:real_estate_task/widgets/gap.dart';
import 'package:real_estate_task/widgets/text_box_field.dart';

import '../../widgets/custom_pop_up_item.dart';

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
      child: Builder(
        builder: (context) {
          if (isPrice) {
            return Text(
              '13,3 mm P',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            );
          }
          return const Icon(Icons.house_siding_sharp);
        },
      ).animate().fade(
            delay: (kDefaultAnimationDuration * 2),
            duration: kDefaultAnimationDuration,
          ),
    ).animate().scale(
          delay: kDefaultAnimationDuration,
          duration: kDefaultAnimationDuration,
          alignment: Alignment.bottomLeft,
        );
  }
}

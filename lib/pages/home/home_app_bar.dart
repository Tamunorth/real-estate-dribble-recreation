import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_task/utils/custom_extensions.dart';
import 'package:real_estate_task/utils/constants.dart';
import 'package:real_estate_task/widgets/custom_number_counter.dart';
import 'package:real_estate_task/widgets/gap.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Text(
                locationText,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ],
          ),
        ).animate().fadeIn().slideX(
              duration: kDefaultAnimationDuration,
              curve: kDefaultCurve,
            ),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/person.png'),
        ).animate().scale(
              duration: kDefaultAnimationDuration * 0.5,
            ),
      ],
    );
  }
}

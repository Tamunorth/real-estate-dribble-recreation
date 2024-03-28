import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_task/utils/custom_extensions.dart';
import 'package:real_estate_task/utils/constants.dart';
import 'package:real_estate_task/widgets/custom_number_counter.dart';
import 'package:real_estate_task/widgets/gap.dart';

enum HouseCardType { vertical, horizontal }

class HouseCard extends StatelessWidget {
  const HouseCard({
    super.key,
    required this.image,
    this.type = HouseCardType.horizontal,
  });

  final String image;
  final HouseCardType? type;

  final double blurContainerHeight = 50;

  final double blurContaierBottomPadding = 10;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.4,
          ),
        ),
        Positioned(
          bottom: blurContaierBottomPadding,
          left: blurContaierBottomPadding,
          right: blurContaierBottomPadding,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    height: blurContainerHeight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: blurContainerHeight * 0.1,
                        ),
                        width: blurContainerHeight * 0.8,
                        height: blurContainerHeight * 0.8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 12,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ),
              )
                  .animate()
                  .slideX(
                    delay: kDefaultAnimationDuration * 0.5,
                    duration: kDefaultAnimationDuration,
                    curve: kDefaultCurve,
                  )
                  .fade(
                    duration: kDefaultAnimationDuration,
                    curve: kDefaultCurve,
                  ),
              const Text(
                'Galadima',
                textAlign: TextAlign.center,
              ).animate().fadeIn(
                    delay: ((kDefaultAnimationDuration * 0.5) +
                        kDefaultAnimationDuration),
                    duration: kDefaultAnimationDuration,
                  ),
            ],
          ),
        )
            .animate()
            .slideX(
              delay: kDefaultAnimationDuration * 0.5,
              duration: kDefaultAnimationDuration,
              curve: kDefaultCurve,
            )
            .fade(
              duration: kDefaultAnimationDuration,
              curve: kDefaultCurve,
            ),
      ],
    );
  }
}

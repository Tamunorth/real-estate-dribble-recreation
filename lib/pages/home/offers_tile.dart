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

class OffersTile extends StatelessWidget {
  const OffersTile({
    super.key,
    required this.decoration,
    required this.textColor,
    required this.title,
    required this.count,
  });
  final BoxDecoration decoration;

  final Color textColor;

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Container(
      width: width * 0.43,
      height: width * 0.43,
      alignment: Alignment.center,
      decoration: decoration,
      child: OfferDetails(
        title: title,
        textColor: textColor,
        offers: count,
      ),
    ).animate().scale(
          duration: kDefaultAnimationDuration,
          curve: kDefaultCurve,
        );
  }
}

class OfferDetails extends StatelessWidget {
  const OfferDetails({
    super.key,
    required this.textColor,
    required this.title,
    required this.offers,
  });

  final Color textColor;

  final String title;

  final num offers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap.h(20),
        Text(
          title,
          style:
              Theme.of(context).textTheme.bodyLarge?.copyWith(color: textColor),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomNumberCounter(
                begin: 0,
                end: offers.toDouble(),
                duration: kDefaultAnimationDuration,
                separator: ',',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
              ),
              Text(
                'Offers',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: textColor

                        // color: Theme.of(context).colorScheme.onPrimary,
                        ),
              ),
            ],
          ),
        ),
        const Gap.h(20),
      ],
    );
  }
}

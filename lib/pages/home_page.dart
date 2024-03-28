import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_task/utils/custom_extensions.dart';
import 'package:real_estate_task/utils/constants.dart';
import 'package:real_estate_task/widgets/count_up.dart';
import 'package:real_estate_task/widgets/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.theme.colorScheme.secondaryContainer,
              context.theme.colorScheme.primary.withOpacity(0.1),
            ],
            stops: const [
              0,
              1,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                const Gap.h(20),
                Text(
                  'Hi, Mariana',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ).animate().fadeIn().slideX(
                      curve: kDefaultCurve,
                      duration: kDefaultAnimationDuration,
                    ),
                Text(
                  "let's select your perfect place",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                )
                    .animate()
                    .slideY(
                      begin: 1,
                      end: 0,
                      curve: kDefaultCurve,
                      duration: kDefaultAnimationDuration,
                    )
                    .fadeIn(),

                const Gap.h(40),
                SizedBox(
                  height: width * 0.43,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OffersTile(
                        title: "BUY",
                        count: 1056,
                        textColor: Theme.of(context).colorScheme.onPrimary,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.theme.primaryColor,
                        ),
                      ),
                      const Gap.w(10),
                      OffersTile(
                        title: "RENT",
                        count: 2212,
                        textColor: Theme.of(context).colorScheme.secondary,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              ///For some reason the primary color does not
                              ///look right in Android hence this
                              Platform.isIOS
                                  ? context.theme.colorScheme.primary
                                      .withOpacity(0.1)
                                  : Colors.yellow.shade50.withOpacity(0.1),
                              context.theme.colorScheme.secondaryContainer,
                            ],
                            stops: const [
                              -1,
                              .3,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // const Gap.h(30),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: DraggableScrollableSheet(
        initialChildSize: 0.45,
        maxChildSize: 0.7,
        minChildSize: 0.45,
        builder: (context, scrollCtrl) {
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: GridView.custom(
              controller: scrollCtrl,
              physics: const ClampingScrollPhysics(),
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                repeatPattern: QuiltedGridRepeatPattern.same,
                pattern: [
                  const QuiltedGridTile(2, 4),
                  const QuiltedGridTile(3, 2),
                  const QuiltedGridTile(3, 2),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) => const HouseCard(
                  image: 'assets/images/image_two.png',
                ),
                childCount: 6,
              ),
            ),
          );
        },
      ).animate().slideY(
            duration: kDefaultAnimationDuration,
            curve: kDefaultCurve,
            begin: 1,
            end: 0,
          ),
    );
  }
}

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

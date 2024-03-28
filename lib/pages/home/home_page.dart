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

import 'home_app_bar.dart';
import 'house_card.dart';
import 'offers_tile.dart';

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

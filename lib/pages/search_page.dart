import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:real_estate_task/utils/constants.dart';
import 'package:real_estate_task/widgets/gap.dart';
import 'package:real_estate_task/widgets/text_box.dart';

import '../widgets/custom_pop_up_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  int selectedItem = 2;

  void _onMapCreated(GoogleMapController controller) async {
    ///load dark map style
    String mapStyle = await rootBundle.loadString('assets/map/dark_map.json');
    mapController = controller;
    await mapController.setMapStyle(mapStyle);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Transform.scale(
            scale: 1.2,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              zoomControlsEnabled: false,
              scrollGesturesEnabled: false,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ).animate().fadeIn(
                  duration: kDefaultAnimationDuration * 0.8,
                ),
          ),
          Positioned(
            left: 50,
            child: CustomMarker(
              isPrice: selectedItem == 2,
            ),
          ),
          Positioned(
            right: 100,
            bottom: 300,
            child: CustomMarker(
              isPrice: selectedItem == 2,
            ),
          ),
          Positioned(
            right: 50,
            bottom: 400,
            child: CustomMarker(
              isPrice: selectedItem == 2,
            ),
          ),
          Positioned(
            right: 50,
            top: 250,
            child: CustomMarker(
              isPrice: selectedItem == 2,
            ),
          ),
          Positioned(
            left: 100,
            top: 200,
            child: CustomMarker(
              isPrice: selectedItem == 2,
            ),
          ),
          Positioned(
            right: 150,
            top: 270,
            child: CustomMarker(
              isPrice: selectedItem == 2,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextBoxField(
                          controller: TextEditingController(text: locationText),
                          decoration: InputDecoration(
                            // hintText: locationText,
                            prefixIcon: const Icon(HeroIcons.magnifying_glass),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            filled: true,
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      )
                          .animate()
                          .fadeIn(
                            duration: kDefaultAnimationDuration,
                          )
                          .slideX(
                            duration: kDefaultAnimationDuration,
                            curve: kDefaultCurve,
                          ),
                      const Gap.w(10),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: Icon(
                          Icons.tune_rounded,
                          size: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                      ).animate().scale(
                            duration: kDefaultAnimationDuration,
                            curve: kDefaultCurve,
                          ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          PopupMenuButton(
                            // position: PopupMenuPosition.under,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            offset: const Offset(0, -110),
                            onSelected: (newItem) {
                              setState(() {
                                selectedItem = newItem;
                              });
                            },
                            itemBuilder: (BuildContext context) => [
                              CustomPopupMenuItem<int>(
                                value: 1,
                                checked: selectedItem == 1,
                                title: 'Cosy areas',
                                icon: FontAwesome.shield_solid,
                              ),
                              CustomPopupMenuItem<int>(
                                value: 2,
                                checked: selectedItem == 2,
                                title: 'Price',
                                icon: FontAwesome.wallet_solid,
                              ),
                              CustomPopupMenuItem<int>(
                                value: 3,
                                checked: selectedItem == 3,
                                title: 'Infrastructure',
                                icon: FontAwesome.basket_shopping_solid,
                              ),
                              CustomPopupMenuItem<int>(
                                value: 4,
                                checked: selectedItem == 4,
                                title: 'Without any layer',
                                icon: FontAwesome.layer_group_solid,
                              ),
                            ],
                            child: const SearchActionButton(
                              child: Icon(
                                CupertinoIcons.layers_alt,
                                size: 16,
                              ),
                            ),
                          ),
                          const Gap.h(5),
                          const SearchActionButton(
                            child: Icon(
                              CupertinoIcons.paperplane,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      SearchActionButton(
                        child: Row(
                          children: [
                            const Icon(
                              HeroIcons.list_bullet,
                              size: 16,
                            ),
                            const Gap.w(5),
                            Text(
                              'List of variants',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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

class SearchActionButton extends StatelessWidget {
  const SearchActionButton({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.withOpacity(0.6),
          ),
          child: child,
        ),
      ),
    ).animate().scale(
          duration: kDefaultAnimationDuration,
          curve: kDefaultCurve,
        );
  }
}

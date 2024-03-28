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

import '../../widgets/custom_pop_up_item.dart';

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

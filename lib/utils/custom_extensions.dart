import 'package:flutter/material.dart';

///Extention to return Theme.of(this)
extension ThemeContextExtension on BuildContext {
  /// Returns the [ThemeData] instance
  ThemeData get theme => Theme.of(this);

  /// Returns the [TextTheme] instance
  TextTheme get textTheme => Theme.of(this).textTheme;
}

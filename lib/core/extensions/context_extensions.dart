import 'package:flutter/material.dart';

extension ContextExtensions<T> on BuildContext{

  Size get size => MediaQuery.of(this).size;
  double get screenHeight => size.height;
  double get screenWidth => size.width;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
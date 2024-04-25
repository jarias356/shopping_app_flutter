import 'package:flutter/material.dart';

class AppBarModel {
  final String title;
  final IconData? iconDataLeading;
  final Function()? onPressedLeading;
  final BuildContext context;

  AppBarModel({
    required this.title,
    required this.context,
    this.iconDataLeading,
    this.onPressedLeading,
  });

}

import 'package:flutter/material.dart';

class NavigationItem {
  int id;
  Icon filled;
  Icon outlined;
  String title;

  NavigationItem({
    required this.id,
    required this.filled,
    required this.outlined,
    required this.title,
  });
}

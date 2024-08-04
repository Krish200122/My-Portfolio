import 'package:flutter/material.dart';

class Variables {
  static final List<String> indextext = [
    "Home",
    "Projects",
    "Services",
  ];
  static int selectedindex = 0;

  static bool isHovered = false;
  static bool abtmeisHovered = false;
  static bool isprofile = false;
  static int hoveredIndex = -1;
  static final ScrollController scrollController = ScrollController();
}

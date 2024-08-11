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
  static bool isprojects1 = false;
  static bool isprojects2 = false;
  static int hoveredIndex = -1;
  static final ScrollController scrollController = ScrollController();

  static var key1 = GlobalKey();
  static var key2 = GlobalKey();
  static var key3 = GlobalKey();
  static var key4 = GlobalKey();
}

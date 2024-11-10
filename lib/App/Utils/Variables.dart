import 'package:flutter/material.dart';

class Variables {
  static final List<String> indextext = [
    "Home",
    "Projects",
    "Services",
  ];
  static int selectedindex = 0;

  static bool isHovered = false;
  static bool iscontactHovered = false;
  static bool abtmeisHovered = false;
  static bool isprofile = false;
  static bool isprojects1 = false;
  static bool isprojects2 = false;
  static int hoveredIndex = -1;
  static final ScrollController scrollController = ScrollController();
  static final ScrollController scrollControllers = ScrollController();
  static double scrollPosition = 0.0;
  static var headerKey = GlobalKey();
  static var key1 = GlobalKey();
  static var key2 = GlobalKey();
  static var key3 = GlobalKey();
  static var key4 = GlobalKey();
  static var abt1key = GlobalKey();
  static var abt2key = GlobalKey();
  static var abt3key = GlobalKey();
  static var abt4key = GlobalKey();
  static var abt5key = GlobalKey();
}

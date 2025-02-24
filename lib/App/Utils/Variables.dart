import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Variables {
  static final List<String> indextext = [
    "Home",
    "Projects",
    "Certificates",
  ];
  static int selectedindex = 0;

  static bool isHovered = false;
  static bool iscontactHovered = false;
  static bool abtmeisHovered = false;
  static bool resumedownHovered = false;
  static bool resumesubmenu = false;
  static bool isprofile = false;
  static bool isprojects1 = false;
  static bool isprojects2 = false;
  static bool iscertificate1 = false;
  static bool iscertificate2 = false;
  static bool isemailprocess = false;
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
  static var experkey = GlobalKey();
  static var abt3key = GlobalKey();
  static var abt4key = GlobalKey();
  static var certificatekey = GlobalKey();
  static var certificatekey2 = GlobalKey();
  static var techstackkey = GlobalKey();
  static var abt5key = GlobalKey();
  static var contactuskey = GlobalKey();

  static final List<Map<String, dynamic>> techStack = [
    {
      "name": "Flutter",
      "icon": FontAwesomeIcons.mobileScreen,
      "desc":
          "Cross-platform UI framework for building beautiful, high-performance apps."
    },
    {
      "name": "Firebase",
      "icon": FontAwesomeIcons.fire,
      "desc":
          "Scalable backend services for authentication, database, and cloud functions."
    },
    {
      "name": "Node.js",
      "icon": FontAwesomeIcons.nodeJs,
      "desc":
          "Efficient server-side runtime for building scalable APIs and microservices."
    },
    {
      "name": "MongoDB",
      "icon": FontAwesomeIcons.database,
      "desc":
          "NoSQL database designed for flexibility and high-performance data handling."
    },
    {
      "name": "Azure",
      "icon": FontAwesomeIcons.cloud,
      "desc":
          "Cloud computing platform for hosting, DevOps, and AI-powered solutions."
    },
    {
      "name": "Docker",
      "icon": FontAwesomeIcons.docker,
      "desc":
          "Containerization tool for deploying apps seamlessly across environments."
    },
    {
      "name": "GitHub Actions",
      "icon": FontAwesomeIcons.gears,
      "desc": "CI/CD automation to streamline development workflows."
    },
    {
      "name": "Android & iOS",
      "icon": FontAwesomeIcons.mobile,
      "desc":
          "Native mobile platforms for delivering top-notch user experiences."
    },
    {
      "name": "CI/CD Pipelines",
      "icon": FontAwesomeIcons.spinner,
      "desc": "Automating testing and deployment for faster delivery."
    },
  ];
}

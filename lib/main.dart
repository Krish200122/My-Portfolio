import 'package:flutter/material.dart';
import 'package:myportfolio/App/Screens/HomeScreen.dart';
import 'package:myportfolio/Views/Themes/Styles/styles.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Krish',
      theme: CustomStyles.themeData,
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(767, name: TABLET),
          const ResponsiveBreakpoint.resize(1024, name: TABLET),
          const ResponsiveBreakpoint.resize(1280, name: DESKTOP),
          const ResponsiveBreakpoint.resize(1281, name: "4k"),
        ],
      ),
      home: const HomePage(),
    );
  }
}

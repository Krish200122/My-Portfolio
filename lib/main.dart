import 'package:flutter/material.dart';
import 'package:myportfolio/App/Screens/HomeScreen.dart';
import 'package:myportfolio/Themes/Styles/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomStyles.themeData,
      home: const HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myportfolio/App/Screens/HomeScreen.dart';
import 'package:myportfolio/Views/Themes/Styles/styles.dart';

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _isInView(double widgetPosition) {
    return _scrollPosition >= widgetPosition - 100 &&
        _scrollPosition <= widgetPosition + 300;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        controller: _scrollController,
        children: [
          _buildContent(0, "Content 1"),
          _buildContent(300, "Content 2"),
          _buildContent(400, "Content 3"),
          _buildContent(500, "Content 4"),
          _buildContent(600, "Content 5"),
          _buildContent(700, "Content 6"),
          // Add more content sections as needed
        ],
      ),
    );
  }

  Widget _buildContent(double position, String text) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: _isInView(position) ? 1.0 : 0.0,
      child: Container(
        height: 300,
        margin: const EdgeInsets.all(20),
        color: Colors.blueAccent,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

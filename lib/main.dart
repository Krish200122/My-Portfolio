import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:myportfolio/App/Screens/HomeScreen.dart';
import 'package:myportfolio/Views/Themes/Styles/styles.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await FlutterDownloader.initialize();
  }
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
      scrollBehavior: const _SmoothScrollBehavior(),
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
      // ✅ No const — HomePage has AnimationControllers
      home: const HomePage(),
    );
  }
}

// Enables smooth mouse-drag scrolling on web/desktop
class _SmoothScrollBehavior extends ScrollBehavior {
  const _SmoothScrollBehavior();
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}
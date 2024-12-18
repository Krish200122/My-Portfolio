// ignore_for_file: file_names

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myportfolio/App/Screens/HomeContent/homecontent.dart';
import 'package:myportfolio/App/Utils/Variables.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';
import 'package:myportfolio/Views/Themes/Icons/icons.dart';
import 'package:myportfolio/Views/Themes/Measures/measures.dart';
import 'package:myportfolio/Views/Animations/animation.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onHover(bool isHovered) {
    setState(() {
      Variables.isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Measures.getHeight(context),
        width: Measures.getWidth(context),
        decoration: const BoxDecoration(),
        child: Stack(children: [
          SizedBox(
            height: Measures.getHeight(context),
            width: Measures.getWidth(context),
            child: Lottie.asset(CustomIcons.bganimation, fit: BoxFit.fitHeight),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: Colors.black.withOpacity(0.8),
                child: Column(
                  children: [
                    SizedBox(
                      height: Measures.getHeight(context) * 0.1,
                      width: Measures.getWidth(context) * 0.95,
                      // color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: Measures.getHeight(context) * 0.08,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    "Krish",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 28,
                                            foreground: Paint()
                                              ..shader =
                                                  AppColorPalette.textGradient),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30.0, left: 5.0),
                                  child: Text(
                                    ".com",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 13,
                                            foreground: Paint()
                                              ..shader = AppColorPalette.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width < 600
                                      ? MediaQuery.of(context).size.width * 0.9
                                      : MediaQuery.of(context).size.width * 0.2,
                                  //    color: Colors.amber,
                                  child: ScrollConfiguration(
                                    behavior: ScrollConfiguration.of(context)
                                        .copyWith(scrollbars: false),
                                    child: GridView.builder(
                                        padding:
                                            const EdgeInsets.only(top: 35.0),
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                        ),
                                        itemCount: Variables.indextext.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              MouseRegion(
                                                onEnter: (_) {
                                                  setState(() {
                                                    Variables.hoveredIndex =
                                                        index;
                                                  });
                                                },
                                                onExit: (_) {
                                                  setState(() {
                                                    Variables.hoveredIndex = -1;
                                                  });
                                                },
                                                child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        Variables
                                                                .selectedindex =
                                                            index;
                                                      });
                                                      if (Variables.indextext[
                                                              index] ==
                                                          "Projects") {
                                                        Scrollable
                                                            .ensureVisible(
                                                                //alignment: -50.0,
                                                                duration:
                                                                    const Duration(
                                                                        seconds:
                                                                            1),
                                                                curve: Curves
                                                                    .easeInOut,
                                                                Variables
                                                                    .abt4key
                                                                    .currentContext!);
                                                      }
                                                      if (Variables.indextext[
                                                              index] ==
                                                          "Home") {
                                                        Scrollable
                                                            .ensureVisible(
                                                                //alignment: -50.0,
                                                                duration:
                                                                    const Duration(
                                                                        seconds:
                                                                            1),
                                                                curve: Curves
                                                                    .easeInOut,
                                                                Variables.key1
                                                                    .currentContext!);
                                                      }
                                                    },
                                                    child: AnimatedContainer(
                                                      duration: const Duration(
                                                          milliseconds: 200),
                                                      transform: Matrix4
                                                          .translationValues(
                                                              0,
                                                              Variables.hoveredIndex ==
                                                                          index &&
                                                                      Variables
                                                                              .selectedindex !=
                                                                          index
                                                                  ? -5
                                                                  : 0,
                                                              0),
                                                      child: Text(
                                                        Variables
                                                            .indextext[index],
                                                        style:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .titleMedium!
                                                                .copyWith(
                                                                  fontSize: Variables.selectedindex ==
                                                                              index ||
                                                                          Variables.hoveredIndex ==
                                                                              index
                                                                      ? ResponsiveWrapper.of(context).screenWidth <
                                                                              600
                                                                          ? 14 // Font size for small screens
                                                                          : ResponsiveWrapper.of(context).screenWidth < 1000
                                                                              ? 16 // Font size for medium screens
                                                                              : 18 // Font size for large screens
                                                                      : 16,
                                                                  foreground: Paint()
                                                                    ..shader = Variables.selectedindex ==
                                                                                index ||
                                                                            Variables.hoveredIndex ==
                                                                                index
                                                                        ? AppColorPalette
                                                                            .textGradient
                                                                        : AppColorPalette
                                                                            .white,
                                                                ),
                                                      ),
                                                    )),
                                              ),
                                              const SizedBox(height: 5.0),
                                              Variables.selectedindex == index
                                                  ? CustomAnimation(
                                                      index: index,
                                                      duration: const Duration(
                                                          milliseconds: 200),
                                                      horizontalOffset: 50.0,
                                                      child: Container(
                                                          height: Measures
                                                                  .getHeight(
                                                                      context) *
                                                              0.003,
                                                          width:
                                                              Measures.getWidth(
                                                                      context) *
                                                                  0.02,
                                                          decoration: const BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  colors: [
                                                                Color.fromARGB(
                                                                    255,
                                                                    95,
                                                                    36,
                                                                    153),
                                                                Color.fromARGB(
                                                                    255,
                                                                    93,
                                                                    13,
                                                                    104)
                                                              ],
                                                                  begin: Alignment
                                                                      .topCenter,
                                                                  end: Alignment
                                                                      .bottomRight))),
                                                    )
                                                  : Container()
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                                MouseRegion(
                                  onEnter: (event) => _onHover(true),
                                  onExit: (event) => _onHover(false),
                                  child: CustomAnimation(
                                    index: 5,
                                    duration:
                                        const Duration(milliseconds: 1100),
                                    horizontalOffset: 50.0,
                                    child: GestureDetector(
                                      onTap: () {
                                        Scrollable.ensureVisible(
                                            alignment: 0.0,
                                            duration:
                                                const Duration(seconds: 1),
                                            curve: Curves.easeInOut,
                                            Variables
                                                .headerKey.currentContext!);
                                      },
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        transform: Matrix4.translationValues(
                                            0, Variables.isHovered ? -5 : 0, 0),
                                        height:
                                            Measures.getHeight(context) * 0.04,
                                        width:
                                            Measures.getWidth(context) * 0.07,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Variables.isHovered
                                                ? Colors.transparent
                                                : const Color.fromARGB(
                                                    255, 135, 24, 245),
                                          ),

                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: Variables.isHovered
                                              ? const LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                        255, 135, 24, 245),
                                                    Color.fromARGB(
                                                        255, 154, 11, 173)
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomRight,
                                                )
                                              : null, // No gradient when not hovered
                                          color: Variables.isHovered
                                              ? null
                                              : Colors
                                                  .transparent, // White background when not hovered
                                        ),
                                        child: Text(
                                          "Contact",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    const HomeContent(),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

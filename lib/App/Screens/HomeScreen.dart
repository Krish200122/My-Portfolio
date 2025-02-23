// ignore_for_file: file_names, deprecated_member_use

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
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Measures.getWidth(context),
          decoration: const BoxDecoration(),
          child: Stack(children: [
            SizedBox(
              height: Measures.getHeight(context) * 0.2,
              width: Measures.getWidth(context),
              child:
                  Lottie.asset(CustomIcons.bganimation, fit: BoxFit.fitHeight),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
              child: SizedBox(
                width: Measures.getWidth(context),

                // color: Colors.amber,
                // padding: EdgeInsets.all(10.0),
                child: Stack(children: [
                  Container(
                    width: Measures.getWidth(context),
                    color: Colors.black.withOpacity(0.8),
                    alignment: Alignment.center,

                    // padding: const EdgeInsets.all(10.0),
                    // ignore: sized_box_for_whitespace
                    child: SizedBox(
                      width: ResponsiveWrapper.of(context).screenWidth < 480 &&
                              ResponsiveWrapper.of(context).screenWidth < 768
                          ? Measures.getWidth(context)
                          : Measures.getWidth(context) * 0.85,
                      child: Column(
                        children: [
                          Container(
                            height: Measures.getHeight(context) * 0.1,
                            width: Measures.getWidth(context) * 0.95,
                            //   color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Krish",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              fontSize: ResponsiveWrapper.of(
                                                              context)
                                                          .screenWidth <
                                                      480
                                                  ? 20 // Small phones
                                                  : ResponsiveWrapper.of(
                                                                  context)
                                                              .screenWidth <
                                                          768
                                                      ? 24 // Large phones and small tablets
                                                      : ResponsiveWrapper.of(
                                                                      context)
                                                                  .screenWidth <
                                                              1024
                                                          ? 26 // Standard tablets
                                                          : ResponsiveWrapper.of(
                                                                          context)
                                                                      .screenWidth <
                                                                  1440
                                                              ? 28 // Desktops
                                                              : 30, // 4K or larger screens
                                              foreground: Paint()
                                                ..shader = AppColorPalette
                                                    .textGradient,
                                            ),
                                      ),
                                      TextSpan(
                                        text: ".com",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              fontSize: 13,
                                              foreground: Paint()
                                                ..shader =
                                                    AppColorPalette.white,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  // color: Colors.green,
                                  width: MediaQuery.of(context).size.width >=
                                          1400
                                      ? MediaQuery.of(context).size.width *
                                          0.35 // Large screens
                                      : MediaQuery.of(context).size.width >=
                                              1024
                                          ? MediaQuery.of(context).size.width *
                                              0.4 // Medium screens
                                          : MediaQuery.of(context).size.width *
                                              0.6, // Small screens
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                          Variables.indextext.length,
                                          (index) => Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                          .size
                                                          .width >=
                                                      1400
                                                  ? 35.0 // Large screens
                                                  : MediaQuery.of(context)
                                                              .size
                                                              .width >=
                                                          1024
                                                      ? 20.0 // Medium screens
                                                      : 10.0, // Small screens (Mobile)
                                            ), // Spacing between items
                                            child: CustomAnimation(
                                              index: index,
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              horizontalOffset: 50.0,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                        Variables.hoveredIndex =
                                                            -1;
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
                                                            Variables.abt4key
                                                                .currentContext!,
                                                            duration:
                                                                const Duration(
                                                                    seconds: 1),
                                                            curve: Curves
                                                                .easeInOut,
                                                          );
                                                        } else if (Variables
                                                                    .indextext[
                                                                index] ==
                                                            "Home") {
                                                          Scrollable
                                                              .ensureVisible(
                                                            Variables.key1
                                                                .currentContext!,
                                                            duration:
                                                                const Duration(
                                                                    seconds: 1),
                                                            curve: Curves
                                                                .easeInOut,
                                                          );
                                                        } else if (Variables
                                                                    .indextext[
                                                                index] ==
                                                            "Certificates") {
                                                          Scrollable
                                                              .ensureVisible(
                                                            Variables
                                                                .certificatekey
                                                                .currentContext!,
                                                            duration:
                                                                const Duration(
                                                                    seconds: 1),
                                                            curve: Curves
                                                                .easeInOut,
                                                          );
                                                        }
                                                      },
                                                      child: AnimatedContainer(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    200),
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
                                                          0,
                                                        ),
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
                                                                            ? 12 // Font size for small screens
                                                                            : ResponsiveWrapper.of(context).screenWidth < 1400
                                                                                ? 16 // Font size for medium screens
                                                                                : 18 // Font size for large screens
                                                                        : 12,
                                                                    foreground: Paint()
                                                                      ..shader = Variables.selectedindex == index ||
                                                                              Variables.hoveredIndex ==
                                                                                  index
                                                                          ? AppColorPalette
                                                                              .textGradient
                                                                          : AppColorPalette
                                                                              .white,
                                                                  ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5.0),
                                                  Variables.selectedindex ==
                                                          index
                                                      ? CustomAnimation(
                                                          index: index,
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      200),
                                                          horizontalOffset:
                                                              50.0,
                                                          child: Container(
                                                            height: Measures
                                                                    .getHeight(
                                                                        context) *
                                                                0.003,
                                                            width: Measures
                                                                    .getWidth(
                                                                        context) *
                                                                0.02,
                                                            decoration:
                                                                const BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          95,
                                                                          36,
                                                                          153),
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          93,
                                                                          13,
                                                                          104),
                                                                ],
                                                                begin: Alignment
                                                                    .topCenter,
                                                                end: Alignment
                                                                    .bottomRight,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: MouseRegion(
                                          onEnter: (event) => _onHover(true),
                                          onExit: (event) => _onHover(false),
                                          child: CustomAnimation(
                                            index: 6,
                                            duration: const Duration(
                                                milliseconds: 1100),
                                            horizontalOffset: 50.0,
                                            child: GestureDetector(
                                              onTap: () {
                                                Scrollable.ensureVisible(
                                                    alignment: 0.0,
                                                    duration: const Duration(
                                                        seconds: 1),
                                                    curve: Curves.easeInOut,
                                                    Variables.headerKey
                                                        .currentContext!);
                                              },
                                              child: AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                transform:
                                                    Matrix4.translationValues(
                                                        0,
                                                        Variables.isHovered
                                                            ? -5
                                                            : 0,
                                                        0),
                                                height: Measures.getHeight(
                                                        context) *
                                                    0.03,
                                                width: ResponsiveWrapper.of(
                                                                context)
                                                            .screenWidth <
                                                        600
                                                    ? Measures.getWidth(
                                                            context) *
                                                        0.11 // For smaller screens
                                                    : ResponsiveWrapper.of(
                                                                    context)
                                                                .screenWidth >=
                                                            1400
                                                        ? Measures.getWidth(
                                                                context) *
                                                            0.05 // For large screens
                                                        : Measures.getWidth(
                                                                context) *
                                                            0.08, // For medium screens

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
                                                  gradient: ResponsiveWrapper
                                                                  .of(context)
                                                              .screenWidth <
                                                          1024
                                                      ? const LinearGradient(
                                                          colors: [
                                                            Color.fromARGB(255,
                                                                135, 24, 245),
                                                            Color.fromARGB(255,
                                                                154, 11, 173)
                                                          ],
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomRight,
                                                        )
                                                      : Variables.isHovered
                                                          ? const LinearGradient(
                                                              colors: [
                                                                Color.fromARGB(
                                                                    255,
                                                                    135,
                                                                    24,
                                                                    245),
                                                                Color.fromARGB(
                                                                    255,
                                                                    154,
                                                                    11,
                                                                    173)
                                                              ],
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomRight,
                                                            )
                                                          : null, // No gradient when not hovered
                                                  color: ResponsiveWrapper.of(
                                                                  context)
                                                              .screenWidth <
                                                          1024
                                                      ? const Color.fromARGB(
                                                          255, 135, 24, 245)
                                                      : Variables.isHovered
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
                                                          fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width <
                                                                  600
                                                              ? 12
                                                              : 15,
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          const Expanded(child: HomeContent()),
                          const SizedBox(height: 50.0),
                          // MediaQuery.of(context).size.width < 600
                          //     ? const MobileViewContactus()
                          //     :
                          // const Contactus()
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

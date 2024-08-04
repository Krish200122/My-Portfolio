// ignore_for_file: file_names

import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:myportfolio/App/Screens/Aboutme/aboutme.dart';
import 'package:myportfolio/App/Utils/Variables.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';
import 'package:myportfolio/Views/Themes/Icons/icons.dart';
import 'package:myportfolio/Views/Themes/Measures/measures.dart';
import 'package:myportfolio/Views/Animations/animation.dart';

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

  void _onabtmeHover(bool isHovered) {
    setState(() {
      Variables.abtmeisHovered = isHovered;
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
            child: Lottie.asset(CustomIcons.bganimation),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
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
                            width: Measures.getWidth(context) * 0.1,
                            // /color: Colors.green,
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
                          Container(
                              height: Measures.getHeight(context) * 0.08,
                              width: Measures.getWidth(context) * 0.3,
                              // color: Colors.pink,
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 20.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GridView.builder(
                                        padding: const EdgeInsets.all(15.0),
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
                                                                      ? 18
                                                                      : 17,
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
                                  MouseRegion(
                                    onEnter: (event) => _onHover(true),
                                    onExit: (event) => _onHover(false),
                                    child: CustomAnimation(
                                      index: 5,
                                      duration:
                                          const Duration(milliseconds: 1100),
                                      horizontalOffset: 50.0,
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
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Variables.selectedindex == 0
                        ? Container(
                            height: Measures.getHeight(context) * 0.85,
                            width: Measures.getWidth(context) * 0.85,
                            // color: Colors.amber,
                            // padding: const EdgeInsets.all(10.0),
                            child: SingleChildScrollView(
                              controller: Variables.scrollController,
                              scrollDirection: Axis.vertical,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          height:
                                              Measures.getHeight(context) * 0.7,
                                          // color: Colors.white,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: Measures.getHeight(
                                                        context) *
                                                    0.38,
                                                width:
                                                    Measures.getWidth(context) *
                                                        0.3,
                                                //    color: Colors.pink,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CustomAnimation(
                                                        index: 1,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        horizontalOffset: 50.0,
                                                        child: FadeInAnimation(
                                                            child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Hey I'm",
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleSmall!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          25,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                            ),
                                                            const SizedBox(
                                                                width: 10.0),
                                                            SizedBox(
                                                              height: Measures
                                                                      .getHeight(
                                                                          context) *
                                                                  0.04,
                                                              child: Lottie.asset(
                                                                  "Assets/Animation/Wave.json"),
                                                            )
                                                          ],
                                                        ))),
                                                    CustomAnimation(
                                                        index: 2,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    800),
                                                        horizontalOffset: 50.0,
                                                        child: Text(
                                                          "Tarun Krishna",
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .titleLarge!
                                                              .copyWith(
                                                                  fontSize: 70,
                                                                  foreground: Paint()
                                                                    ..shader =
                                                                        AppColorPalette
                                                                            .textGradient),
                                                        )),
                                                    CustomAnimation(
                                                        index: 3,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    900),
                                                        horizontalOffset: 50.0,
                                                        child: Text(
                                                          "Flutter Developer",
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .titleLarge!
                                                              .copyWith(
                                                                  fontSize: 40,
                                                                  color: Colors
                                                                      .white),
                                                        )),
                                                    CustomAnimation(
                                                        index: 4,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    1000),
                                                        horizontalOffset: 50.0,
                                                        child: Text(
                                                          "Passionate about crafting beautiful and functional mobile applications with Flutter. Specializing in creating seamless user experiences with cutting-edge technology.",
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleSmall!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .white54,
                                                                  ),
                                                        )),
                                                    const SizedBox(
                                                        height: 20.0),
                                                    MouseRegion(
                                                      onEnter: (event) =>
                                                          _onabtmeHover(true),
                                                      onExit: (event) =>
                                                          _onabtmeHover(false),
                                                      child: CustomAnimation(
                                                        index: 5,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    1100),
                                                        horizontalOffset: 50.0,
                                                        child: GestureDetector(
                                                          onTap: () {},
                                                          child:
                                                              AnimatedContainer(
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        200),
                                                            transform: Matrix4
                                                                .translationValues(
                                                                    0,
                                                                    Variables
                                                                            .abtmeisHovered
                                                                        ? -5
                                                                        : 0,
                                                                    0),
                                                            height: Measures
                                                                    .getHeight(
                                                                        context) *
                                                                0.04,
                                                            width: Measures
                                                                    .getWidth(
                                                                        context) *
                                                                0.07,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Variables
                                                                        .abtmeisHovered
                                                                    ? Colors
                                                                        .transparent
                                                                    : const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        135,
                                                                        24,
                                                                        245),
                                                              ),

                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              gradient: Variables
                                                                      .abtmeisHovered
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
                                                              color: Variables
                                                                      .abtmeisHovered
                                                                  ? null
                                                                  : Colors
                                                                      .transparent, // White background when not hovered
                                                            ),
                                                            child: Text(
                                                              "About me",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleSmall!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                  width: Measures.getWidth(
                                                          context) *
                                                      0.35,
                                                  // color: Colors.amber,

                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        CustomAnimation(
                                                          index: 6,
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          horizontalOffset:
                                                              50.0,
                                                          child: DottedBorder(
                                                            color:
                                                                Colors.white54,
                                                            dashPattern: const [
                                                              2,
                                                              4
                                                            ],
                                                            radius: const Radius
                                                                .circular(20.0),
                                                            borderType:
                                                                BorderType
                                                                    .RRect,
                                                            strokeWidth: 3,
                                                            child:
                                                                const FlutterLogo(
                                                                    size: 148),
                                                          ),
                                                        ),
                                                        CustomAnimation(
                                                          index: 7,
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      700),
                                                          horizontalOffset:
                                                              50.0,
                                                          child: DottedBorder(
                                                            dashPattern: const [
                                                              2,
                                                              4
                                                            ],
                                                            color:
                                                                Colors.white54,
                                                            strokeWidth: 3,
                                                            radius: const Radius
                                                                .circular(20.0),
                                                            borderType:
                                                                BorderType
                                                                    .RRect,
                                                            child:
                                                                const FlutterLogo(
                                                                    size: 148),
                                                          ),
                                                        ),
                                                        CustomAnimation(
                                                            index: 8,
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        900),
                                                            horizontalOffset:
                                                                50.0,
                                                            child: DottedBorder(
                                                              dashPattern: const [
                                                                2,
                                                                4
                                                              ],
                                                              radius:
                                                                  const Radius
                                                                      .circular(
                                                                      20.0),
                                                              borderType:
                                                                  BorderType
                                                                      .RRect,
                                                              color: Colors
                                                                  .white54,
                                                              strokeWidth: 3,
                                                              child:
                                                                  const FlutterLogo(
                                                                      size:
                                                                          148),
                                                            ))
                                                      ]))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height:
                                            Measures.getHeight(context) * 0.6,
                                        width: Measures.getWidth(context) * 0.3,
                                        // color: Colors.amber,
                                        alignment: Alignment.center,
                                        child: Stack(
                                          children: [
                                            Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: CustomAnimation(
                                                  index: 9,
                                                  duration: const Duration(
                                                      milliseconds: 800),
                                                  horizontalOffset: 50.0,
                                                  child: Container(
                                                    height: Measures.getHeight(
                                                            context) *
                                                        0.35,
                                                    width: Measures.getWidth(
                                                            context) *
                                                        0.25,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white70,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                  ),
                                                )),
                                            CustomAnimation(
                                                index: 10,
                                                duration: const Duration(
                                                    milliseconds: 900),
                                                verticalOffset: 50.0,
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    height: Measures.getHeight(
                                                            context) *
                                                        0.4,
                                                    width: Measures.getWidth(
                                                            context) *
                                                        0.2,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                CustomIcons
                                                                    .profile),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  // Container(
                                  //   height: 300,
                                  //   width: 300,
                                  //   color: Colors.pink,
                                  // ),
                                  // Container(
                                  //   height: 300,
                                  //   width: 300,
                                  //   color: Colors.green,
                                  // ),
                                  // Container(
                                  //   height: 300,
                                  //   width: 300,
                                  //   color: Colors.pink,
                                  // )
                                  const AboutMe(
                                    txtno: "01.",
                                    title: "About Me",
                                    descrption:
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
                                    descrption2:
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
                                    descrption3: "",
                                    descrption4:
                                        "Here are few Technologioes I've been Working with Recently",
                                    isprofile: true,
                                  ),
                                  const SizedBox(height: 70.0),
                                  const AboutMe(
                                    txtno: "02.",
                                    title: "Where I've Worked",
                                    descrption:
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
                                    descrption2: "",
                                    descrption4: "Senior Flutter Developer",
                                    isprofile: false,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
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

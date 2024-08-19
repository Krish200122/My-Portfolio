import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:myportfolio/App/Screens/Aboutme/aboutme.dart';
import 'package:myportfolio/App/Screens/Projects/projects.dart';
import 'package:myportfolio/App/Utils/Variables.dart';
import 'package:myportfolio/Views/Animations/animation.dart';
import 'package:myportfolio/Views/Themes/Icons/icons.dart';
import 'package:myportfolio/Views/Themes/Measures/measures.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  void _onabtmeHover(bool isHovered) {
    setState(() {
      Variables.abtmeisHovered = isHovered;
    });
  }

  @override
  void initState() {
    super.initState();
    Variables.scrollControllers.addListener(() {
      setState(() {
        Variables.scrollPosition = Variables.scrollControllers.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    Variables.scrollControllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Measures.getHeight(context) * 0.85,
      width: Measures.getWidth(context) * 0.85,
      child: SingleChildScrollView(
        controller: Variables.scrollControllers,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: Measures.getHeight(context) * 0.7,
                    // color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: Measures.getHeight(context) * 0.38,
                          width: Measures.getWidth(context) * 0.3,
                          // color: Colors.pink,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomAnimation(
                                  index: 1,
                                  duration: const Duration(milliseconds: 500),
                                  horizontalOffset: 50.0,
                                  child: FadeInAnimation(
                                      child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hey I'm",
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(width: 10.0),
                                      SizedBox(
                                        height:
                                            Measures.getHeight(context) * 0.04,
                                        child: Lottie.asset(
                                            "Assets/Animation/Wave.json"),
                                      )
                                    ],
                                  ))),
                              CustomAnimation(
                                  index: 2,
                                  duration: const Duration(milliseconds: 800),
                                  horizontalOffset: 50.0,
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        'Tarun Krishna',
                                        cursor: '',
                                        textStyle: const TextStyle(
                                            fontSize: 70.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple),
                                        speed:
                                            const Duration(milliseconds: 200),
                                      ),
                                    ],
                                    totalRepeatCount: 4,
                                    pause: const Duration(milliseconds: 200),
                                    displayFullTextOnTap: true,
                                    stopPauseOnTap: true,
                                  )
                                  // runs after the above w/new duration
                                  ),
                              CustomAnimation(
                                  index: 3,
                                  duration: const Duration(milliseconds: 900),
                                  horizontalOffset: 50.0,
                                  child: Text(
                                    "Flutter Developer",
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            fontSize: 40, color: Colors.white),
                                  )),
                              CustomAnimation(
                                  index: 4,
                                  duration: const Duration(milliseconds: 1000),
                                  horizontalOffset: 50.0,
                                  child: Text(
                                    "Passionate about crafting beautiful and functional mobile applications with Flutter. Specializing in creating seamless user experiences with cutting-edge technology.",
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: 18,
                                          color: Colors.white54,
                                        ),
                                  )),
                              const SizedBox(height: 20.0),
                              MouseRegion(
                                onEnter: (event) => _onabtmeHover(true),
                                onExit: (event) => _onabtmeHover(false),
                                child: CustomAnimation(
                                  index: 5,
                                  duration: const Duration(milliseconds: 1100),
                                  horizontalOffset: 50.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      Scrollable.ensureVisible(
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.easeInOut,
                                          Variables.key1.currentContext!);
                                    },
                                    child: AnimatedContainer(
                                      key: Variables.key1,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      transform: Matrix4.translationValues(0,
                                          Variables.abtmeisHovered ? -5 : 0, 0),
                                      height:
                                          Measures.getHeight(context) * 0.04,
                                      width: Measures.getWidth(context) * 0.07,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Variables.abtmeisHovered
                                              ? Colors.transparent
                                              : const Color.fromARGB(
                                                  255, 135, 24, 245),
                                        ),

                                        borderRadius: BorderRadius.circular(10),
                                        gradient: Variables.abtmeisHovered
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
                                        color: Variables.abtmeisHovered
                                            ? null
                                            : Colors
                                                .transparent, // White background when not hovered
                                      ),
                                      child: Text(
                                        "About me",
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
                        ),
                        SizedBox(
                            width: Measures.getWidth(context) * 0.35,
                            //  color: Colors.amber,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomAnimation(
                                    index: 6,
                                    duration: const Duration(milliseconds: 500),
                                    horizontalOffset: 50.0,
                                    child: SizedBox(
                                      height:
                                          Measures.getHeight(context) * 0.16,
                                      // width: Measures.getWidth(context) * 0.085,
                                      child: DottedBorder(
                                          color: Colors.white54,
                                          dashPattern: const [2, 4],
                                          radius: const Radius.circular(20.0),
                                          borderType: BorderType.RRect,
                                          padding: const EdgeInsets.all(20.0),
                                          strokeWidth: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                // color: Colors.white,
                                                child: Text(
                                                  "Services",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                          fontSize: 15,
                                                          color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(
                                                height: Measures.getHeight(
                                                        context) *
                                                    0.07,
                                                width:
                                                    Measures.getWidth(context) *
                                                        0.07,
                                                // color: Colors.white,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: Measures.getWidth(
                                                              context) *
                                                          0.02,
                                                      child: Image.asset(
                                                          filterQuality:
                                                              FilterQuality
                                                                  .high,
                                                          CustomIcons.mondoDb),
                                                    ),
                                                    SizedBox(
                                                      width: Measures.getWidth(
                                                              context) *
                                                          0.02,
                                                      child: Image.asset(
                                                          filterQuality:
                                                              FilterQuality
                                                                  .high,
                                                          CustomIcons.firebase),
                                                    ),
                                                    SizedBox(
                                                      width: Measures.getWidth(
                                                              context) *
                                                          0.025,
                                                      child: Image.asset(
                                                          filterQuality:
                                                              FilterQuality
                                                                  .high,
                                                          CustomIcons.nodejs),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                  CustomAnimation(
                                    index: 7,
                                    duration: const Duration(milliseconds: 700),
                                    horizontalOffset: 50.0,
                                    child: SizedBox(
                                      height:
                                          Measures.getHeight(context) * 0.16,
                                      // width: Measures.getWidth(context) * 0.085,
                                      child: DottedBorder(
                                          color: Colors.white54,
                                          dashPattern: const [2, 4],
                                          radius: const Radius.circular(20.0),
                                          borderType: BorderType.RRect,
                                          padding: const EdgeInsets.all(20.0),
                                          strokeWidth: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                // color: Colors.white,
                                                child: Text(
                                                  "Projects",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                          fontSize: 15,
                                                          color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(
                                                height: Measures.getHeight(
                                                        context) *
                                                    0.07,
                                                width:
                                                    Measures.getWidth(context) *
                                                        0.07,
                                                // color: Colors.white,
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                  CustomAnimation(
                                    index: 8,
                                    duration: const Duration(milliseconds: 900),
                                    horizontalOffset: 50.0,
                                    child: SizedBox(
                                      height:
                                          Measures.getHeight(context) * 0.16,
                                      // width: Measures.getWidth(context) * 0.085,
                                      child: DottedBorder(
                                          color: Colors.white54,
                                          dashPattern: const [2, 4],
                                          radius: const Radius.circular(20.0),
                                          borderType: BorderType.RRect,
                                          padding: const EdgeInsets.all(20.0),
                                          strokeWidth: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                // color: Colors.white,
                                                child: Text(
                                                  "Cloud",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                          fontSize: 15,
                                                          color: Colors.white),
                                                ),
                                              ),
                                              Container(
                                                height: Measures.getHeight(
                                                        context) *
                                                    0.07,
                                                width:
                                                    Measures.getWidth(context) *
                                                        0.07,
                                                // color: Colors.white,
                                                alignment: Alignment.center,
                                                child: Image.asset(
                                                    filterQuality:
                                                        FilterQuality.high,
                                                    CustomIcons.azure),
                                              )
                                            ],
                                          )),
                                    ),
                                  )
                                ]))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: Measures.getHeight(context) * 0.6,
                  width: Measures.getWidth(context) * 0.3,
                  // color: Colors.amber,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomAnimation(
                            index: 9,
                            duration: const Duration(milliseconds: 800),
                            horizontalOffset: 50.0,
                            child: Container(
                              height: Measures.getHeight(context) * 0.35,
                              width: Measures.getWidth(context) * 0.25,
                              decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(20.0)),
                            ),
                          )),
                      CustomAnimation(
                          index: 10,
                          duration: const Duration(milliseconds: 900),
                          verticalOffset: 50.0,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: Measures.getHeight(context) * 0.4,
                              width: Measures.getWidth(context) * 0.2,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(CustomIcons.profile),
                                      fit: BoxFit.cover)),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
            // const SizedBox(height: 50.0),
            AboutMe(
              txtno: "01.",
              keys: Variables.abt1key,
              title: "About Me",
              descrption:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
              descrption2:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
              descrption3: "",
              descrption4:
                  "Here are few Technologioes I've been Working with Recently",
              isprofile: true,
              duration: const Duration(milliseconds: 400),
              index: 1,
              isVisible: Measures.isInView(Variables.abt1key, context),
            ),
            //    const SizedBox(height: 70.0),
            AboutMe(
              txtno: "02.",
              keys: Variables.abt2key,
              title: "Where I've Worked",
              descrption:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
              descrption2: "",
              descrption3: "Senior Flutter Developer",
              descrption4: "January 2023 ",
              isprofile: false,
              duration: const Duration(milliseconds: 500),
              index: 2,
              isVisible: Measures.isInView(Variables.abt2key, context),
            ),
            //   const SizedBox(height: 80.0),
            projects(
              textno: "03.",
              keys: Variables.abt3key,
              duration: const Duration(milliseconds: 700),
              texttitle: "Featured Projects",
              ischangePosition: false,
              textsubtitle: "Travel Management - Projects",
              textdesc:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
              textend: "Dart  Android  IOS",
              title: "Project's Which I've Build ",
              index: 3,
              isVisible: Measures.isInView(Variables.abt3key, context),
            ),
            projects(
              ischangePosition: true,
              keys: Variables.abt4key,
              duration: const Duration(milliseconds: 800),
              texttitle: "Featured Projects",
              textsubtitle: "AlgoTrading - Projects",
              textdesc:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
              textend: "Dart  Android  IOS",
              index: 4,
              isVisible: Measures.isInView(Variables.abt4key, context),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:download/download.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:myportfolio/App/Function/emailsend.dart';
import 'package:myportfolio/App/Screens/Aboutme/aboutme.dart';
import 'package:myportfolio/App/Screens/Certification/certificates.dart';
import 'package:myportfolio/App/Screens/ContactUs/contactus.dart';
import 'package:myportfolio/App/Screens/Projects/projects.dart';
import 'package:myportfolio/App/Screens/TechStack/teckstack.dart';
import 'package:myportfolio/App/Utils/Variables.dart';
import 'package:myportfolio/Views/Animations/animation.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';
import 'package:myportfolio/Views/Themes/Icons/icons.dart';
import 'package:myportfolio/Views/Themes/Measures/measures.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

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

  void _ondownHover(bool isHovered) {
    setState(() {
      Variables.resumedownHovered = isHovered;
    });
  }

  @override
  void initState() {
    super.initState();
    Variables.scrollControllers.addListener(() {
      if (mounted) {
        setState(() {
          Variables.scrollPosition =
              Variables.scrollControllers.position.pixels;
        });
      }
    });
  }

  @override
  void dispose() {
    // Variables.scrollControllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Measures.getHeight(context) * 0.85,
      width: Measures.getWidth(context) * 0.85,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          controller: Variables.scrollControllers,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20.0),
              Measures.islargerScreen(context)
                  ? ProfileRowContent(context)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomAnimation(
                                        index: 1,
                                        duration:
                                            const Duration(milliseconds: 500),
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
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            const SizedBox(width: 20.0),
                                            SizedBox(
                                              height:
                                                  Measures.getHeight(context) *
                                                      0.04,
                                              child: Lottie.asset(
                                                  "Assets/Animation/Wave.json"),
                                            )
                                          ],
                                        ))),
                                    const SizedBox(height: 10.0),
                                    CustomAnimation(
                                        index: 2,
                                        duration:
                                            const Duration(milliseconds: 800),
                                        horizontalOffset: 50.0,
                                        child: AnimatedTextKit(
                                          animatedTexts: [
                                            TypewriterAnimatedText(
                                              'Tarun Krishna',
                                              cursor: '',
                                              textStyle: TextStyle(
                                                foreground: Paint()
                                                  ..shader = AppColorPalette
                                                      .textGradient,
                                                fontSize: 60.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              speed: const Duration(
                                                  milliseconds: 200),
                                            ),
                                          ],
                                          totalRepeatCount: 4,
                                          pause:
                                              const Duration(milliseconds: 200),
                                          displayFullTextOnTap: true,
                                          stopPauseOnTap: true,
                                        )
                                        // runs after the above w/new duration
                                        ),
                                    const SizedBox(height: 10.0),
                                    CustomAnimation(
                                        index: 3,
                                        duration:
                                            const Duration(milliseconds: 900),
                                        horizontalOffset: 50.0,
                                        child: Text(
                                          "Flutter Developer & Devops Engineer",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  fontSize: 40,
                                                  color: Colors.white),
                                        )),
                                    const SizedBox(height: 10.0),
                                    CustomAnimation(
                                        index: 4,
                                        duration:
                                            const Duration(milliseconds: 1000),
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
                                    const SizedBox(height: 30.0),
                                    Row(
                                      children: [
                                        MouseRegion(
                                          onEnter: (event) =>
                                              _onabtmeHover(true),
                                          onExit: (event) =>
                                              _onabtmeHover(false),
                                          child: CustomAnimation(
                                            index: 5,
                                            duration: const Duration(
                                                milliseconds: 1100),
                                            horizontalOffset: 50.0,
                                            child: GestureDetector(
                                              onTap: () {
                                                Scrollable.ensureVisible(
                                                    duration: const Duration(
                                                        seconds: 1),
                                                    curve: Curves.easeInOut,
                                                    Variables
                                                        .key1.currentContext!);
                                              },
                                              child: AnimatedContainer(
                                                key: Variables.key1,
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                transform:
                                                    Matrix4.translationValues(
                                                        0,
                                                        Variables.abtmeisHovered
                                                            ? -5
                                                            : 0,
                                                        0),
                                                height: Measures.getHeight(
                                                        context) *
                                                    0.05,
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width >=
                                                        1400
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.35 // Large screens
                                                    : MediaQuery.of(context)
                                                                .size
                                                                .width >=
                                                            1024
                                                        ? MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4 // Medium screens
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Variables
                                                            .abtmeisHovered
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
                                                      : Variables.abtmeisHovered
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
                                                      : Variables.abtmeisHovered
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
                                        ),
                                        const SizedBox(width: 20.0),
                                        MouseRegion(
                                          onEnter: (event) =>
                                              _ondownHover(true),
                                          onExit: (event) =>
                                              _ondownHover(false),
                                          child: CustomAnimation(
                                            index: 6,
                                            duration: const Duration(
                                                milliseconds: 1100),
                                            horizontalOffset: 50.0,
                                            child: GestureDetector(
                                              onTap: () async {
                                                await emailservice
                                                    .downloadPdf("");
                                              },
                                              child: AnimatedContainer(
                                                // key: Variables.key1,
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                transform:
                                                    Matrix4.translationValues(
                                                        0,
                                                        Variables
                                                                .resumedownHovered
                                                            ? -5
                                                            : 0,
                                                        0),
                                                height: Measures.getHeight(
                                                        context) *
                                                    0.05,
                                                // width: Measures.getWidth(context) * 0.09,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Variables
                                                            .resumedownHovered
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
                                                      : Variables
                                                              .resumedownHovered
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
                                                          1020
                                                      ? const Color.fromARGB(
                                                          255, 135, 24, 245)
                                                      : Variables
                                                              .resumedownHovered
                                                          ? null
                                                          : Colors
                                                              .transparent, // White background when not hovered
                                                ),
                                                child: Text(
                                                  "Download Resume",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                          fontSize:
                                                              ResponsiveWrapper.of(
                                                                          context)
                                                                      .isTablet
                                                                  ? 12
                                                                  : 15,
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                // Row(
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.start,
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       CustomAnimation(
                                //         index: 6,
                                //         duration:
                                //             const Duration(milliseconds: 500),
                                //         horizontalOffset: 50.0,
                                //         child: SizedBox(
                                //           child: DottedBorder(
                                //               color: Colors.white54,
                                //               dashPattern: const [2, 4],
                                //               radius:
                                //                   const Radius.circular(20.0),
                                //               borderType: BorderType.RRect,
                                //               padding:
                                //                   const EdgeInsets.all(20.0),
                                //               strokeWidth: 3,
                                //               child: Column(
                                //                 crossAxisAlignment:
                                //                     CrossAxisAlignment.center,
                                //                 mainAxisAlignment:
                                //                     MainAxisAlignment
                                //                         .spaceBetween,
                                //                 children: [
                                //                   Container(
                                //                     alignment: Alignment.center,
                                //                     // color: Colors.white,
                                //                     child: Text(
                                //                       "Certificates",
                                //                       style: Theme.of(context)
                                //                           .textTheme
                                //                           .titleSmall!
                                //                           .copyWith(
                                //                               fontSize: 15,
                                //                               color:
                                //                                   Colors.white),
                                //                     ),
                                //                   ),
                                //                   SizedBox(
                                //                     height: Measures.getHeight(
                                //                             context) *
                                //                         0.07,
                                //                     width: Measures.getWidth(
                                //                             context) *
                                //                         0.07,
                                //                     // color: Colors.white,
                                //                     child: Row(
                                //                       mainAxisAlignment:
                                //                           MainAxisAlignment
                                //                               .spaceBetween,
                                //                       children: [
                                //                         SizedBox(
                                //                           width:
                                //                               Measures.getWidth(
                                //                                       context) *
                                //                                   0.02,
                                //                           child: Image.asset(
                                //                               filterQuality:
                                //                                   FilterQuality
                                //                                       .high,
                                //                               CustomIcons
                                //                                   .mondoDb),
                                //                         ),
                                //                         SizedBox(
                                //                           width:
                                //                               Measures.getWidth(
                                //                                       context) *
                                //                                   0.02,
                                //                           child: Image.asset(
                                //                               filterQuality:
                                //                                   FilterQuality
                                //                                       .high,
                                //                               CustomIcons
                                //                                   .firebase),
                                //                         ),
                                //                         SizedBox(
                                //                           width:
                                //                               Measures.getWidth(
                                //                                       context) *
                                //                                   0.025,
                                //                           child: Image.asset(
                                //                               filterQuality:
                                //                                   FilterQuality
                                //                                       .high,
                                //                               CustomIcons
                                //                                   .nodejs),
                                //                         )
                                //                       ],
                                //                     ),
                                //                   )
                                //                 ],
                                //               )),
                                //         ),
                                //       ),
                                //       CustomAnimation(
                                //         index: 7,
                                //         duration:
                                //             const Duration(milliseconds: 700),
                                //         horizontalOffset: 50.0,
                                //         child: SizedBox(
                                //           // width: Measures.getWidth(context) * 0.085,
                                //           child: DottedBorder(
                                //               color: Colors.white54,
                                //               dashPattern: const [2, 4],
                                //               radius:
                                //                   const Radius.circular(20.0),
                                //               borderType: BorderType.RRect,
                                //               padding:
                                //                   const EdgeInsets.all(20.0),
                                //               strokeWidth: 3,
                                //               child: Column(
                                //                 crossAxisAlignment:
                                //                     CrossAxisAlignment.center,
                                //                 mainAxisAlignment:
                                //                     MainAxisAlignment
                                //                         .spaceBetween,
                                //                 children: [
                                //                   Container(
                                //                     alignment: Alignment.center,
                                //                     // color: Colors.white,
                                //                     child: Text(
                                //                       "Projects",
                                //                       style: Theme.of(context)
                                //                           .textTheme
                                //                           .titleSmall!
                                //                           .copyWith(
                                //                               fontSize: 15,
                                //                               color:
                                //                                   Colors.white),
                                //                     ),
                                //                   ),
                                //                   SizedBox(
                                //                     height: Measures.getHeight(
                                //                             context) *
                                //                         0.07,
                                //                     width: Measures.getWidth(
                                //                             context) *
                                //                         0.07,
                                //                     //     color: Colors.white,
                                //                   )
                                //                 ],
                                //               )),
                                //         ),
                                //       ),
                                //       CustomAnimation(
                                //         index: 8,
                                //         duration:
                                //             const Duration(milliseconds: 900),
                                //         horizontalOffset: 50.0,
                                //         child: SizedBox(
                                //           // width: Measures.getWidth(context) * 0.085,
                                //           child: DottedBorder(
                                //               color: Colors.white54,
                                //               dashPattern: const [2, 4],
                                //               radius:
                                //                   const Radius.circular(20.0),
                                //               borderType: BorderType.RRect,
                                //               padding:
                                //                   const EdgeInsets.all(20.0),
                                //               strokeWidth: 3,
                                //               child: Column(
                                //                 crossAxisAlignment:
                                //                     CrossAxisAlignment.center,
                                //                 mainAxisAlignment:
                                //                     MainAxisAlignment
                                //                         .spaceBetween,
                                //                 children: [
                                //                   Container(
                                //                     alignment: Alignment.center,
                                //                     // color: Colors.white,
                                //                     child: Text(
                                //                       "Cloud",
                                //                       style: Theme.of(context)
                                //                           .textTheme
                                //                           .titleSmall!
                                //                           .copyWith(
                                //                               fontSize: 15,
                                //                               color:
                                //                                   Colors.white),
                                //                     ),
                                //                   ),
                                //                   Container(
                                //                     height: Measures.getHeight(
                                //                             context) *
                                //                         0.07,
                                //                     width: Measures.getWidth(
                                //                             context) *
                                //                         0.07,
                                //                     // color: Colors.white,
                                //                     alignment: Alignment.center,
                                //                     child: Image.asset(
                                //                         filterQuality:
                                //                             FilterQuality.high,
                                //                         CustomIcons.azure),
                                //                   )
                                //                 ],
                                //               )),
                                //         ),
                                //       )
                                //     ])
                              ],
                            ),
                          ),
                          Container(
                            height: Measures.getHeight(context) * 0.45,
                            //color: Colors.amber,
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: CustomAnimation(
                                      index: 9,
                                      duration:
                                          const Duration(milliseconds: 800),
                                      horizontalOffset: 50.0,
                                      child: Container(
                                        height:
                                            Measures.getHeight(context) * 0.35,
                                        // width:
                                        //     Measures.getWidth(context) * 0.25,
                                        decoration: BoxDecoration(
                                            color: Colors.white24,
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                      ),
                                    )),
                                CustomAnimation(
                                    index: 10,
                                    duration: const Duration(milliseconds: 900),
                                    verticalOffset: 50.0,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height:
                                            Measures.getHeight(context) * 0.4,
                                        //  width: Measures.getWidth(context) * 0.2,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    CustomIcons.profile),
                                                fit: BoxFit.cover)),
                                      ),
                                    ))
                              ],
                            ),
                          )
                        ]),
              const SizedBox(height: 30.0),
              MediaQuery.of(context).size.width < 600
                  ? MobileAboutMe(
                      txtno: "01.",
                      keys: Variables.abt1key,
                      title: "About Me",
                      descrption:
                          "I am a passionate Flutter Developer with expertise in building high-performance, scalable, and visually appealing cross-platform applications. My focus is on writing clean, maintainable code following best practices and leveraging state management solutions like Provider and BLoC to optimize app performance.Beyond app development, I have a strong background in Azure DevOps, specializing in CI/CD pipelines, containerized deployments, and infrastructure automation. I excel in setting up efficient DevOps workflows, ensuring seamless integration, deployment, and monitoring of applications in cloud environments.",
                      descrption2: "",
                      descrption3: "",
                      descrption4:
                          "Here are few Technologioes I've been Working with Recently",
                      isprofile: true,
                      duration: const Duration(milliseconds: 400),
                      index: 1,
                      isVisible: Measures.isInView(Variables.abt1key, context),
                    )
                  : AboutMe(
                      txtno: "01.",
                      keys: Variables.abt1key,
                      title: "About Me",
                      descrption:
                          "I am a passionate Flutter Developer with expertise in building high-performance, scalable, and visually appealing cross-platform applications. My focus is on writing clean, maintainable code following best practices and leveraging state management solutions like Provider and BLoC to optimize app performance.Beyond app development, I have a strong background in Azure DevOps, specializing in CI/CD pipelines, containerized deployments, and infrastructure automation. I excel in setting up efficient DevOps workflows, ensuring seamless integration, deployment, and monitoring of applications in cloud environments.",
                      descrption2: "",
                      descrption3: "",
                      descrption4:
                          "Here are few Technologioes I've been Working with Recently",
                      isprofile: true,
                      duration: const Duration(milliseconds: 400),
                      index: 1,
                      isVisible: Measures.isInView(Variables.abt1key, context),
                    ),
              const SizedBox(height: 70.0),
              MediaQuery.of(context).size.width < 600
                  ? MobileAboutMe(
                      txtno: "02.",
                      keys: Variables.abt2key,
                      title: "Where I've Worked",
                      descrption:
                          "At TamuInfotech , I honed my expertise in crafting seamless, high-performance Flutter applications, driving innovation through robust UI/UX design, state management, and cross-platform development.",
                      descrption2: "",
                      descrption3: "Senior Flutter Developer",
                      descrption4: "January 2023 - January 2025  ",
                      isprofile: false,
                      duration: const Duration(milliseconds: 500),
                      index: 2,
                      isVisible: Measures.isInView(Variables.abt2key, context),
                    )
                  : AboutMe(
                      txtno: "02.",
                      keys: Variables.abt2key,
                      title: "Where I've Worked",
                      descrption:
                          "At TamuInfotech , I honed my expertise in crafting seamless, high-performance Flutter applications, driving innovation through robust UI/UX design, state management, and cross-platform development.",
                      descrption2: "",
                      descrption3: "Senior Flutter Developer",
                      descrption4: "January 2023 - January 2025 ",
                      isprofile: false,
                      duration: const Duration(milliseconds: 500),
                      index: 2,
                      isVisible: Measures.isInView(Variables.abt2key, context),
                    ),
              const SizedBox(height: 30.0),
              MediaQuery.of(context).size.width < 600
                  ? MobileAboutMe(
                      txtno: "03.",
                      keys: Variables.experkey,
                      title: "Where I've Worked",
                      descrption:
                          "At TamuInfotech, I played a pivotal role in designing and implementing DevOps strategies, streamlining CI/CD pipelines, automating workflows, and ensuring system reliability at scale.",
                      descrption2: "",
                      descrption3: "Devops Engineer",
                      descrption4: "November 2024 -  present ",
                      isprofile: false,
                      duration: const Duration(milliseconds: 500),
                      index: 3,
                      isVisible: Measures.isInView(Variables.experkey, context),
                    )
                  : AboutMe(
                      txtno: "03.",
                      keys: Variables.experkey,
                      title: "Where I've Worked",
                      descrption:
                          "At TamuInfotech, I played a pivotal role in designing and implementing DevOps strategies, streamlining CI/CD pipelines, automating workflows, and ensuring system reliability at scale.",
                      descrption2: "",
                      descrption3: "Devops Engineer",
                      descrption4: "November 2024 -  Present ",
                      isprofile: false,
                      duration: const Duration(milliseconds: 500),
                      index: 3,
                      isVisible: Measures.isInView(Variables.experkey, context),
                    ),
              const SizedBox(height: 80.0),
              MediaQuery.of(context).size.width < 600
                  ? MobileViewProjects(
                      textno: "04.",
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
                    )
                  : projects(
                      textno: "04.",
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
              MediaQuery.of(context).size.width < 600
                  ? MobileViewProjects(
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
                    )
                  : projects(
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
              ResponsiveWrapper.of(context).screenWidth < 1024
                  ? const SizedBox(
                      height: 30,
                    )
                  : const SizedBox(),
              MediaQuery.of(context).size.width < 600
                  ? MobileViewCertificate(
                      textno: "05.",
                      keys: Variables.certificatekey,
                      duration: const Duration(milliseconds: 500),
                      texttitle: "Certification",
                      ischangePosition: false,
                      textsubtitle:
                          "AZ-204: Developing Solutions for Microsoft Azure",
                      textdesc:
                          "Successfully completed the AZ-204 certification, demonstrating expertise in developing, deploying, and maintaining cloud applications on Microsoft Azure.",
                      textend: "Microsoft Azure  Cloud Development  DevOps",
                      title: "Certification Earned",
                      index: 5,
                      isVisible:
                          Measures.isInView(Variables.certificatekey, context),
                    )
                  : Certification(
                      textno: "05.",
                      keys: Variables.certificatekey,
                      duration: const Duration(milliseconds: 500),
                      texttitle: "Certification",
                      ischangePosition: false,
                      textsubtitle:
                          "AZ-204: Developing Solutions for Microsoft Azure",
                      textdesc:
                          "Successfully completed the AZ-204 certification, demonstrating expertise in developing, deploying, and maintaining cloud applications on Microsoft Azure.",
                      textend: "Microsoft Azure  Cloud Development  DevOps",
                      title: "Certification Earned",
                      index: 5,
                      isVisible:
                          Measures.isInView(Variables.certificatekey, context),
                    ),
              MediaQuery.of(context).size.width < 600
                  ? MobileViewCertificate(
                      ischangePosition: true,
                      keys: Variables.certificatekey2,
                      duration: const Duration(milliseconds: 500),
                      texttitle: "Certification",
                      textsubtitle:
                          "AZ-400: Designing and Implementing DevOps Solutions",
                      textdesc:
                          "Successfully earned the AZ-400 certification, showcasing expertise in designing and implementing DevOps practices, CI/CD pipelines, and automation on Microsoft Azure.",
                      textend: "Microsoft Azure  DevOps  CI/CD  Automation",
                      index: 6,
                      isVisible:
                          Measures.isInView(Variables.certificatekey2, context),
                    )
                  : Certification(
                      ischangePosition: true,
                      keys: Variables.certificatekey2,
                      duration: const Duration(milliseconds: 500),
                      texttitle: "Certification",
                      textsubtitle:
                          "AZ-400: Designing and Implementing DevOps Solutions",
                      textdesc:
                          "Successfully earned the AZ-400 certification, showcasing expertise in designing and implementing DevOps practices, CI/CD pipelines, and automation on Microsoft Azure.",
                      textend: "Microsoft Azure  DevOps  CI/CD  Automation",
                      index: 6,
                      isVisible:
                          Measures.isInView(Variables.certificatekey2, context),
                    ),
              const SizedBox(height: 30.0),
              TechStackSection(
                techkeys: Variables.techstackkey,
                index: 7,
                duration: const Duration(milliseconds: 500),
                isVisible: Measures.isInView(Variables.techstackkey, context),
              ),
              const SizedBox(height: 50.0),
              MediaQuery.of(context).size.width < 600
                  ? const MobileViewContactus()
                  : const Contactus()
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Row ProfileRowContent(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                //  height: Measures.getHeight(context) * 0.38,
                width: Measures.getWidth(context) * 0.3,
                // color: Colors.pink,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomAnimation(
                        index: 1,
                        duration: const Duration(milliseconds: 500),
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            const SizedBox(width: 20.0),
                            SizedBox(
                              height: Measures.getHeight(context) * 0.04,
                              child: Lottie.asset("Assets/Animation/Wave.json"),
                            )
                          ],
                        ))),
                    const SizedBox(height: 10.0),
                    CustomAnimation(
                        index: 2,
                        duration: const Duration(milliseconds: 800),
                        horizontalOffset: 50.0,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Tarun Krishna',
                              cursor: '',
                              textStyle: TextStyle(
                                foreground: Paint()
                                  ..shader = AppColorPalette.textGradient,
                                fontSize: 70.0,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 200),
                            ),
                          ],
                          totalRepeatCount: 4,
                          pause: const Duration(milliseconds: 200),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        )
                        // runs after the above w/new duration
                        ),
                    const SizedBox(height: 10.0),
                    CustomAnimation(
                        index: 3,
                        duration: const Duration(milliseconds: 900),
                        horizontalOffset: 50.0,
                        child: Text(
                          "Flutter Developer & Devops Engineer",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 40, color: Colors.white),
                        )),
                    const SizedBox(height: 10.0),
                    CustomAnimation(
                        index: 4,
                        duration: const Duration(milliseconds: 1000),
                        horizontalOffset: 50.0,
                        child: Text(
                          "Passionate about crafting beautiful and functional mobile applications with Flutter. Specializing in creating seamless user experiences with cutting-edge technology.",
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 18,
                                    color: Colors.white54,
                                  ),
                        )),
                    const SizedBox(height: 30.0),
                    Row(
                      children: [
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
                                duration: const Duration(milliseconds: 200),
                                transform: Matrix4.translationValues(
                                    0, Variables.abtmeisHovered ? -5 : 0, 0),
                                height: Measures.getHeight(context) * 0.07,
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
                                            Color.fromARGB(255, 135, 24, 245),
                                            Color.fromARGB(255, 154, 11, 173)
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
                                          fontSize:
                                              ResponsiveWrapper.of(context)
                                                      .isTablet
                                                  ? 12
                                                  : 15,
                                          color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 40.0),
                        MouseRegion(
                          onEnter: (event) => _ondownHover(true),
                          onExit: (event) => _ondownHover(false),
                          child: Stack(
                            children: [
                              CustomAnimation(
                                index: 6,
                                duration: const Duration(milliseconds: 1100),
                                horizontalOffset: 50.0,
                                child: GestureDetector(
                                  onTap:
                                      () {}, // Prevents accidental taps on hover
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    padding: const EdgeInsets.all(10.0),
                                    transform: Matrix4.translationValues(
                                        0,
                                        Variables.resumedownHovered ? -5 : 0,
                                        0),
                                    height: ResponsiveWrapper.of(context)
                                                .screenWidth ==
                                            1024
                                        ? Measures.getHeight(context) * 0.07
                                        : Measures.getHeight(context) * 0.07,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Variables.resumedownHovered
                                            ? Colors.transparent
                                            : const Color.fromARGB(
                                                255, 135, 24, 245),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: Variables.resumedownHovered
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
                                          : null,
                                      color: Variables.resumedownHovered
                                          ? null
                                          : Colors.transparent,
                                    ),
                                    child: Text(
                                      "Download Resume",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontSize:
                                                  ResponsiveWrapper.of(context)
                                                          .isTablet
                                                      ? 12
                                                      : 15,
                                              color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              if (Variables
                                  .resumedownHovered) // Show options on hover
                                AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity:
                                      Variables.resumedownHovered ? 1.0 : 0.0,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    transform: Matrix4.translationValues(
                                        0,
                                        Variables.resumedownHovered ? 0 : -10,
                                        0),
                                    width: 160,
                                    margin: const EdgeInsets.only(top: 50),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 5,
                                          spreadRadius: 1,
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        _downloadOption(
                                          context,
                                          "Cloud Resume",
                                          () async {
                                            final resumeBytes =
                                                await rootBundle.load(
                                                    'Assets/Images/DevopsResume.pdf');
                                            final stream = Stream.fromIterable(
                                                resumeBytes.buffer
                                                    .asUint8List());

                                            // Trigger download
                                            download(stream, 'Resume.pdf');
                                          },
                                        ),
                                        _downloadOption(
                                            context, "Flutter Resume",
                                            () async {
                                          final resumeBytes = await rootBundle.load(
                                              'Assets/Images/FlutterResume.pdf');
                                          final stream = Stream.fromIterable(
                                              resumeBytes.buffer.asUint8List());

                                          // Trigger download
                                          download(stream, 'Resume.pdf');
                                        }),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              // Container(
              //     width: Measures.getWidth(context) * 0.5,
              //     child: Row(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           CustomAnimation(
              //             index: 6,
              //             duration: const Duration(milliseconds: 500),
              //             horizontalOffset: 50.0,
              //             child: DottedBorder(
              //                 color: Colors.white54,
              //                 dashPattern: const [2, 4],
              //                 radius: const Radius.circular(20.0),
              //                 borderType: BorderType.RRect,
              //                 padding: const EdgeInsets.all(20.0),
              //                 strokeWidth: 3,
              //                 child: Container(
              //                   // alignment: Alignment.center,
              //                   child: Column(
              //                     children: [
              //                       Text(
              //                         "Certificates",
              //                         style: Theme.of(context)
              //                             .textTheme
              //                             .titleSmall!
              //                             .copyWith(
              //                                 fontSize: 15,
              //                                 color: Colors.white),
              //                       ),
              //                       const SizedBox(height: 20.0),
              //                       Container(
              //                         height:
              //                             Measures.getHeight(context) * 0.07,
              //                         padding:
              //                             const EdgeInsets.only(right: 20.0),
              //                         // color: Colors.white,
              //                         child: Row(
              //                             crossAxisAlignment:
              //                                 CrossAxisAlignment.center,
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.center,
              //                             children: [
              //                               Image.asset(
              //                                   scale: 5,
              //                                   filterQuality:
              //                                       FilterQuality.high,
              //                                   CustomIcons.az204),
              //                               Image.asset(
              //                                   scale: 5,
              //                                   filterQuality:
              //                                       FilterQuality.high,
              //                                   CustomIcons.az400),
              //                             ]),
              //                       )
              //                     ],
              //                   ),
              //                 )),
              //           ),
              //           CustomAnimation(
              //             index: 7,
              //             duration: const Duration(milliseconds: 700),
              //             horizontalOffset: 50.0,
              //             child: SizedBox(
              //               // width: Measures.getWidth(context) * 0.085,
              //               child: DottedBorder(
              //                   color: Colors.white54,
              //                   dashPattern: const [2, 4],
              //                   radius: const Radius.circular(20.0),
              //                   borderType: BorderType.RRect,
              //                   padding: const EdgeInsets.all(20.0),
              //                   strokeWidth: 3,
              //                   child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Container(
              //                         alignment: Alignment.center,
              //                         // color: Colors.white,
              //                         child: Text(
              //                           "Projects",
              //                           style: Theme.of(context)
              //                               .textTheme
              //                               .titleSmall!
              //                               .copyWith(
              //                                   fontSize: 15,
              //                                   color: Colors.white),
              //                         ),
              //                       ),
              //                       const SizedBox(height: 20.0),
              //                       SizedBox(
              //                         height:
              //                             Measures.getHeight(context) * 0.07,

              //                         // color: Colors.white,
              //                         child: Row(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.center,
              //                             children: [
              //                               Image.asset(
              //                                   scale: 4,
              //                                   filterQuality:
              //                                       FilterQuality.high,
              //                                   CustomIcons.alogoapp),
              //                               const SizedBox(width: 20.0),
              //                               Image.asset(
              //                                   scale: 2,
              //                                   filterQuality:
              //                                       FilterQuality.high,
              //                                   CustomIcons.logicapp),
              //                             ]),
              //                       )
              //                     ],
              //                   )),
              //             ),
              //           ),
              //           CustomAnimation(
              //             index: 8,
              //             duration: const Duration(milliseconds: 900),
              //             horizontalOffset: 50.0,
              //             child: SizedBox(
              //               // width: Measures.getWidth(context) * 0.085,
              //               child: DottedBorder(
              //                   color: Colors.white54,
              //                   dashPattern: const [2, 4],
              //                   radius: const Radius.circular(20.0),
              //                   borderType: BorderType.RRect,
              //                   padding: const EdgeInsets.all(20.0),
              //                   strokeWidth: 3,
              //                   child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Container(
              //                         alignment: Alignment.center,
              //                         // color: Colors.white,
              //                         child: Text(
              //                           "Technology",
              //                           style: Theme.of(context)
              //                               .textTheme
              //                               .titleSmall!
              //                               .copyWith(
              //                                   fontSize: 15,
              //                                   color: Colors.white),
              //                         ),
              //                       ),
              //                       const SizedBox(height: 20.0),
              //                       SizedBox(
              //                         height:
              //                             Measures.getHeight(context) * 0.07,

              //                         // color: Colors.white,
              //                         child: Row(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.center,
              //                             children: [
              //                               Image.asset(
              //                                   scale: 6,
              //                                   filterQuality:
              //                                       FilterQuality.high,
              //                                   CustomIcons.azure),
              //                               const SizedBox(width: 20.0),
              //                               Image.asset(
              //                                   scale: 2,
              //                                   filterQuality:
              //                                       FilterQuality.high,
              //                                   CustomIcons.flutter),
              //                             ]),
              //                       )
              //                     ],
              //                   )),
              //             ),
              //           )
              //         ]))
            ],
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
        ]);
  }

  Widget _downloadOption(
      BuildContext context, String text, Future<void> Function() onTap) {
    return MouseRegion(
      onEnter: (_) => setState(() => Variables.resumedownHovered = true),
      onExit: (_) => setState(() => Variables.resumedownHovered = false),
      child: GestureDetector(
        onTap: () async {
          await onTap();
          setState(() =>
              Variables.resumedownHovered = false); // Reset hover after click
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: Variables.resumedownHovered
                ? const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 135, 24, 245),
                      Color.fromARGB(255, 154, 11, 173)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                  )
                : null,
            borderRadius: BorderRadius.circular(5),
            color: Variables.resumedownHovered ? null : Colors.transparent,
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14,
                    color: Variables.resumedownHovered
                        ? Colors.white
                        : Colors.black,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/App/Utils/Variables.dart';
import 'package:myportfolio/Views/Animations/animation.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';
import 'package:myportfolio/Views/Themes/Measures/measures.dart';
import 'package:url_launcher/url_launcher.dart';

class projects extends StatefulWidget {
  String? textno;
  String texttitle;
  Key? keys;
  String textsubtitle;
  String textdesc;
  String textend;
  String? title;
  Duration? duration;
  final double? isVisible;
  int? index;
  bool ischangePosition;
  projects(
      {super.key,
      this.textno = "",
      this.keys,
      this.texttitle = "",
      required this.textsubtitle,
      required this.textdesc,
      required this.textend,
      this.duration,
      this.isVisible,
      this.index,
      this.title = "",
      this.ischangePosition = false});

  @override
  State<projects> createState() => _projectsState();
}

class _projectsState extends State<projects> {
  void _onprofile(bool isHovered) {
    setState(() {
      Variables.isprojects1 = isHovered;
    });
  }

  void _onprofile2(bool isHovered) {
    setState(() {
      Variables.isprojects2 = isHovered;
    });
  }

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: widget.isVisible!,
        duration: widget.duration!,
        child: Container(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            key: widget.keys,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              widget.isVisible! != 0
                  ? CustomAnimation(
                      index: widget.index!,
                      duration: widget.duration!,
                      verticalOffset: 50.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.textno!,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 19,
                                    foreground: Paint()
                                      ..shader = AppColorPalette.textGradient),
                          ),
                          const SizedBox(width: 20.0),
                          Text(
                            widget.title!,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 22,
                                    foreground: Paint()
                                      ..shader = AppColorPalette.white),
                          ),
                          const SizedBox(
                            width: 30.0,
                          ),
                          widget.textno == "" || widget.texttitle == ""
                              ? Container()
                              : SizedBox(
                                  width: Measures.getWidth(context) * 0.1,
                                  child: const Divider(
                                    height: 0.3,
                                    color: Colors.white60,
                                  ),
                                )
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 20.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                if (widget.ischangePosition == true) ...[
                  widget.isVisible! != 0
                      ? CustomAnimation(
                          index: widget.index!,
                          duration: widget.duration!,
                          horizontalOffset: 50.0,
                          child: Container(
                            width: Measures.getWidth(context) * 0.3,
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment:
                                  widget.ischangePosition == true
                                      ? CrossAxisAlignment.start
                                      : CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  widget.texttitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontSize: 15, color: Colors.white54),
                                ),
                                Text(
                                  widget.textsubtitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontSize: 22,
                                          foreground: Paint()
                                            ..shader = AppColorPalette.white),
                                ),
                                widget.isVisible! != 0
                                    ? CustomAnimation(
                                        index: widget.index!,
                                        duration: widget.duration!,
                                        horizontalOffset: 50.0,
                                        child: Container(
                                          //  height: Measures.getHeight(context) * 0.2,
                                          // width:
                                          //     Measures.getWidth(context) * 0.25,
                                          padding: const EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                      255, 95, 36, 153)
                                                  .withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(16.0)),
                                          alignment: Alignment.center,
                                          child: Text(
                                            widget.textdesc,
                                            textAlign:
                                                widget.ischangePosition == true
                                                    ? TextAlign.start
                                                    : TextAlign.end,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 17,
                                                    color: const Color.fromARGB(
                                                        255, 156, 156, 156),
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                                Text(
                                  widget.textend,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: 14,
                                        color: Colors.white54,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (event) => _onprofile(true),
                    onExit: (event) => _onprofile(false),
                    child: widget.isVisible! != 0.0
                        ? GestureDetector(
                            onTap: () async {
                              final Uri url = Uri.parse(
                                  "https://play.google.com/store/apps/details?id=com.myalgoai.alicealgo_app&hl=en");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url,
                                    mode: LaunchMode.externalApplication);
                              } else {
                                throw "Could not launch $widget.hyperlink!";
                              }
                            },
                            child: CustomAnimation(
                              index: widget.index!,
                              duration: widget.duration!,
                              horizontalOffset: 50.0,
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                onEnter: (_) =>
                                    setState(() => isHovered = true),
                                onExit: (_) =>
                                    setState(() => isHovered = false),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      transform: Matrix4.translationValues(0,
                                          Variables.isprojects1 ? -20 : 0, 0),
                                      height: Measures.getHeight(context) * 0.3,
                                      width: Measures.getWidth(context) * 0.3,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "Assets/Images/DALL·E 2025-02-24 21.36.37 - A clean and simple mobile app interface for an Algo Trading strategy application. The design features a minimalist light-themed UI with intuitive navi.webp"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      foregroundDecoration: BoxDecoration(
                                        color: isHovered
                                            ? Colors.black.withOpacity(0.8)
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                    if (isHovered)
                                      Text(
                                        "Explore AlgoTrading App",
                                        style: GoogleFonts.lato(
                                            fontSize: 28,
                                            foreground: Paint()
                                              ..shader = AppColorPalette.white),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ] else ...[
                  MouseRegion(
                      onEnter: (event) => _onprofile2(true),
                      onExit: (event) => _onprofile2(false),
                      child: widget.isVisible! != 0
                          ? CustomAnimation(
                              index: widget.index!,
                              duration: widget.duration!,
                              horizontalOffset: 50.0,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                transform: Matrix4.translationValues(
                                    0, Variables.isprojects2 ? -20 : 0, 0),
                                child: Container(
                                  height: Measures.getHeight(context) * 0.3,
                                  width: Measures.getWidth(context) * 0.3,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "Assets/Images/TravelAppMangement.jpg"),
                                          fit: BoxFit.cover),
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                ),
                              ),
                            )
                          : const SizedBox.shrink()),
                  widget.isVisible! != 0
                      ? CustomAnimation(
                          index: widget.index!,
                          duration: widget.duration!,
                          horizontalOffset: 50.0,
                          child: Container(
                            width: Measures.getWidth(context) * 0.3,
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: widget.ischangePosition
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  widget.texttitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontSize: 15, color: Colors.white54),
                                ),
                                Text(
                                  widget.textsubtitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: 22,
                                        foreground: Paint()
                                          ..shader = AppColorPalette.white,
                                      ),
                                ),
                                Container(
                                  //  height: Measures.getHeight(context) * 0.2,
                                  // width: Measures.getWidth(context) * 0.25,

                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 95, 36, 153)
                                              .withOpacity(0.3),
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    widget.textdesc,
                                    textAlign: TextAlign.end,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 17,
                                            color: const Color.fromARGB(
                                                255, 156, 156, 156),
                                            fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  widget.textend,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: 14,
                                        color: Colors.white54,
                                      ),
                                ),
                              ],
                            ),
                          ))
                      : const SizedBox.shrink()
                ],
              ])
            ],
          ),
        ));
  }
}

class MobileViewProjects extends StatefulWidget {
  String? textno;
  String texttitle;
  Key? keys;
  String textsubtitle;
  String textdesc;
  String textend;
  String? title;
  Duration? duration;
  final double? isVisible;
  int? index;
  bool ischangePosition;
  MobileViewProjects(
      {super.key,
      this.textno = "",
      this.keys,
      this.texttitle = "",
      required this.textsubtitle,
      required this.textdesc,
      required this.textend,
      this.duration,
      this.isVisible,
      this.index,
      this.title = "",
      this.ischangePosition = false});

  @override
  State<MobileViewProjects> createState() => _MobileViewProjectsState();
}

class _MobileViewProjectsState extends State<MobileViewProjects> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: widget.isVisible!,
        duration: widget.duration!,
        child: Column(
          key: widget.keys,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            widget.isVisible! != 0
                ? CustomAnimation(
                    index: widget.index!,
                    duration: widget.duration!,
                    verticalOffset: 50.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.textno!,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 19,
                                  foreground: Paint()
                                    ..shader = AppColorPalette.textGradient),
                        ),
                        const SizedBox(width: 20.0),
                        Text(
                          widget.title!,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 17,
                                  foreground: Paint()
                                    ..shader = AppColorPalette.white),
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        widget.textno == "" || widget.texttitle == ""
                            ? Container()
                            : SizedBox(
                                width: Measures.getWidth(context) * 0.1,
                                child: const Divider(
                                  height: 0.3,
                                  color: Colors.white60,
                                ),
                              ),
                      ],
                    ),
                  )
                : const SizedBox(
                    height: 20.0,
                  ),
            const SizedBox(
              height: 30.0,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (widget.ischangePosition == true) ...[
                    widget.isVisible! != 0
                        ? CustomAnimation(
                            index: widget.index!,
                            duration: widget.duration!,
                            horizontalOffset: 50.0,
                            child: Container(
                              width: Measures.getWidth(context),
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment:
                                    widget.ischangePosition == true
                                        ? CrossAxisAlignment.start
                                        : CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    widget.texttitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 15,
                                            color: Colors.white54),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Text(
                                    widget.textsubtitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 22,
                                            foreground: Paint()
                                              ..shader = AppColorPalette.white),
                                  ),
                                  const SizedBox(height: 20.0),
                                  widget.isVisible! != 0
                                      ? CustomAnimation(
                                          index: widget.index!,
                                          duration: widget.duration!,
                                          horizontalOffset: 50.0,
                                          child: Container(
                                            padding: const EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                        255, 95, 36, 153)
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.0)),
                                            alignment: Alignment.center,
                                            child: Text(
                                              widget.textdesc,
                                              textAlign:
                                                  widget.ischangePosition ==
                                                          true
                                                      ? TextAlign.start
                                                      : TextAlign.end,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      fontSize: 17,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              156,
                                                              156,
                                                              156),
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  const SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      Text(
                                        "MyAlgoTrading – ",
                                        style: GoogleFonts.lato(
                                          fontSize: 18,
                                          color: Colors.white,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          final Uri url = Uri.parse(
                                              "https://play.google.com/store/apps/details?id=com.myalgoai.alicealgo_app&hl=en"); // Replace with your actual link
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url,
                                                mode: LaunchMode
                                                    .externalApplication);
                                          } else {
                                            throw "Could not launch $url";
                                          }
                                        },
                                        child: Text(
                                          "AlgoTrading App",
                                          style: GoogleFonts.lato(
                                            fontSize: 20,
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20.0),
                                  Text(
                                    widget.textend,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: 14,
                                          color: Colors.white54,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    CustomAnimation(
                      index: widget.index!,
                      duration: widget.duration!,
                      horizontalOffset: 50.0,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        transform: Matrix4.translationValues(
                            0, Variables.isprojects1 ? -20 : 0, 0),
                        height: Measures.getHeight(context) * 0.3,
                        width: Measures.getWidth(context),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: const DecorationImage(
                                image: AssetImage(
                                    "Assets/Images/DALL·E 2025-02-24 21.36.37 - A clean and simple mobile app interface for an Algo Trading strategy application. The design features a minimalist light-themed UI with intuitive navi.webp"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(16.0)),
                      ),
                    ),
                  ] else ...[
                    CustomAnimation(
                      index: widget.index!,
                      duration: widget.duration!,
                      horizontalOffset: 50.0,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        transform: Matrix4.translationValues(
                            0, Variables.isprojects2 ? -20 : 0, 0),
                        child: Container(
                          height: Measures.getHeight(context) * 0.35,
                          width: Measures.getWidth(context),
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "Assets/Images/TravelAppMangement.jpg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(16.0)),
                        ),
                      ),
                    ),
                    widget.isVisible! != 0
                        ? CustomAnimation(
                            index: widget.index!,
                            duration: widget.duration!,
                            horizontalOffset: 50.0,
                            child: Container(
                              width: Measures.getWidth(context),
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: widget.ischangePosition
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    widget.texttitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 15,
                                            color: Colors.white54),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    widget.textsubtitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: 22,
                                          foreground: Paint()
                                            ..shader = AppColorPalette.white,
                                        ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Container(
                                    //  height: Measures.getHeight(context) * 0.2,
                                    // width: Measures.getWidth(context) * 0.25,

                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                                255, 95, 36, 153)
                                            .withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      widget.textdesc,
                                      textAlign: TextAlign.end,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontSize: 17,
                                              color: const Color.fromARGB(
                                                  255, 156, 156, 156),
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    widget.textend,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: 14,
                                          color: Colors.white54,
                                        ),
                                  ),
                                ],
                              ),
                            ))
                        : const SizedBox.shrink()
                  ],
                ])
          ],
        ));
  }
}

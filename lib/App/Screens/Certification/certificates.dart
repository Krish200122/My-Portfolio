// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:myportfolio/App/Utils/Variables.dart';
import 'package:myportfolio/Views/Animations/animation.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';
import 'package:myportfolio/Views/Themes/Measures/measures.dart';

class Certification extends StatefulWidget {
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
  Certification(
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
  State<Certification> createState() => _CertificationState();
}

class _CertificationState extends State<Certification> {
  void _onprofile(bool isHovered) {
    setState(() {
      Variables.iscertificate1 = isHovered;
    });
  }

  void _onprofile2(bool isHovered) {
    setState(() {
      Variables.iscertificate2 = isHovered;
    });
  }

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
                    onEnter: (event) => _onprofile(true),
                    onExit: (event) => _onprofile(false),
                    child: widget.isVisible! != 0.0
                        ? CustomAnimation(
                            index: widget.index!,
                            duration: widget.duration!,
                            horizontalOffset: 50.0,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              transform: Matrix4.translationValues(
                                  0, Variables.iscertificate1 ? -20 : 0, 0),
                              height: Measures.getHeight(context) * 0.3,
                              width: Measures.getWidth(context) * 0.25,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image:
                                        AssetImage("Assets/Images/az-400.png"),
                                    fit: BoxFit.contain),
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
                                    0, Variables.iscertificate2 ? -20 : 0, 0),
                                child: Container(
                                  height: Measures.getHeight(context) * 0.3,
                                  width: Measures.getWidth(context) * 0.3,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "Assets/Images/az-204.png"),
                                          fit: BoxFit.fitHeight),
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

class MobileViewCertificate extends StatefulWidget {
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
  MobileViewCertificate(
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
  State<MobileViewCertificate> createState() => _MobileViewCertificateState();
}

class _MobileViewCertificateState extends State<MobileViewCertificate> {
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
                                  const SizedBox(height: 10.0),
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
                                  const SizedBox(height: 10.0),
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
                            0, Variables.iscertificate1 ? -20 : 0, 0),
                        height: Measures.getHeight(context) * 0.3,
                        width: Measures.getWidth(context),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: const DecorationImage(
                                image: AssetImage(
                                    "Assets/Images/TravelAppMangement.jpg"),
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
                            0, Variables.iscertificate2 ? -20 : 0, 0),
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

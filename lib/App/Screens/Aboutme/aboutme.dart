import 'package:flutter/material.dart';
import 'package:myportfolio/App/Utils/Variables.dart';
import 'package:myportfolio/Views/Animations/animation.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';
import 'package:myportfolio/Views/Themes/Icons/icons.dart';
import 'package:myportfolio/Views/Themes/Measures/measures.dart';

class AboutMe extends StatefulWidget {
  final String txtno;
  final String title;
  final String descrption;
  final String? descrption2;
  final String? descrption3;
  final String? descrption4;
  final bool isprofile;
  final Duration duration;
  final int index;
  const AboutMe(
      {super.key,
      required this.txtno,
      required this.title,
      required this.descrption,
      this.descrption2,
      this.descrption3,
      this.descrption4,
      required this.index,
      required this.duration,
      required this.isprofile});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  void _onprofile(bool isHovered) {
    setState(() {
      Variables.isprofile = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: Measures.getHeight(context) * 0.5,
      width: Measures.getWidth(context) * 0.65,
      // color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Measures.getHeight(context) * 0.09,
            width: Measures.getWidth(context) * 0.3,
//color: Colors.black,
            child: CustomAnimation(
              duration: widget.duration,
              index: widget.index,
              horizontalOffset: 50.0,
              child: Row(
                children: [
                  Text(
                    widget.txtno,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 19,
                        foreground: Paint()
                          ..shader = AppColorPalette.textGradient),
                  ),
                  const SizedBox(width: 20.0),
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 22,
                        foreground: Paint()..shader = AppColorPalette.white),
                  ),
                  const SizedBox(width: 30.0),
                  SizedBox(
                    width: Measures.getWidth(context) * 0.1,
                    child: const Divider(
                      height: 0.3,
                      color: Colors.white60,
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                //height: Measures.getHeight(context) * 0.3,
                width: Measures.getWidth(context) * 0.3,
                //   color: Colors.amber,
                child: CustomAnimation(
                  duration: const Duration(milliseconds: 800),
                  index: 12,
                  horizontalOffset: 50.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.descrption,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 17,
                                  color: Colors.white60,
                                ),
                      ),
                      const SizedBox(height: 10.0),
                      widget.descrption2 != null
                          ? Text(
                              widget.descrption2!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: 17,
                                    color: Colors.white60,
                                  ),
                            )
                          : Container(),
                      SizedBox(height: widget.descrption2 == "" ? 0.0 : 20.0),
                      widget.descrption3 == ""
                          ? Row(
                              children: [
                                Text(
                                  "I have Build ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: 17,
                                        color: Colors.white60,
                                      ),
                                ),
                                const SizedBox(width: 5.0),
                                Text(
                                  "Awesome Apps",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontSize: 19,
                                          foreground: Paint()
                                            ..shader =
                                                AppColorPalette.textGradient),
                                ),
                              ],
                            )
                          : Container(),
                      SizedBox(height: widget.descrption2 == "" ? 0.0 : 30.0),
                      Text(
                        widget.descrption4 ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 17,
                                foreground: Paint()
                                  ..shader = widget.descrption4 ==
                                          "Senior Flutter Developer"
                                      ? AppColorPalette.textGradient
                                      : AppColorPalette.white),
                      ),
                    ],
                  ),
                ),
              ),
              widget.isprofile
                  ? Container(
                      height: Measures.getHeight(context) * 0.4,
                      width: Measures.getWidth(context) * 0.3,
                      //  color: Colors.pink,
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CustomAnimation(
                            duration: const Duration(milliseconds: 900),
                            index: 13,
                            horizontalOffset: 50.0,
                            child: Container(
                                height: Measures.getHeight(context) * 0.35,
                                width: Measures.getWidth(context) * 0.17,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 3,
                                  color:
                                      const Color.fromARGB(255, 135, 24, 245),
                                ))),
                          ),
                          Positioned(
                            top: 0,
                            left: 40,
                            bottom: 40,
                            child: MouseRegion(
                              onEnter: (event) => _onprofile(true),
                              onExit: (event) => _onprofile(false),
                              child: CustomAnimation(
                                duration: const Duration(milliseconds: 900),
                                index: 14,
                                verticalOffset: 50.0,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  transform: Matrix4.translationValues(
                                      0, Variables.isprofile ? -20 : 0, 0),
                                  child: Container(
                                    height: Measures.getHeight(context) * 0.15,
                                    width: Measures.getWidth(context) * 0.18,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Image.asset(CustomIcons.profile),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container()
            ],
          )
        ],
      ),
    );
  }
}

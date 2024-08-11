import 'package:flutter/material.dart';
import 'package:myportfolio/App/Utils/Variables.dart';
import 'package:myportfolio/Views/Animations/animation.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';
import 'package:myportfolio/Views/Themes/Measures/measures.dart';

class projects extends StatefulWidget {
  String? textno;
  String texttitle;
  Key? keys;
  String textsubtitle;
  String textdesc;
  String textend;
  String? title;
  bool ischangePosition;
  projects(
      {super.key,
      this.textno = "",
      this.keys,
      this.texttitle = "",
      required this.textsubtitle,
      required this.textdesc,
      required this.textend,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Measures.getHeight(context) * 0.45,
      width: Measures.getWidth(context) * 0.8,
      //color: Colors.pink,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomAnimation(
            index: 11,
            duration: const Duration(milliseconds: 900),
            verticalOffset: 50.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.textno!,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 19,
                      foreground: Paint()
                        ..shader = AppColorPalette.textGradient),
                ),
                const SizedBox(width: 20.0),
                Text(
                  widget.title!,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 22,
                      foreground: Paint()..shader = AppColorPalette.white),
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
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            if (widget.ischangePosition == true) ...[
              CustomAnimation(
                index: 11,
                duration: const Duration(milliseconds: 1000),
                horizontalOffset: 50.0,
                child: Container(
                  height: Measures.getHeight(context) * 0.3,
                  width: Measures.getWidth(context) * 0.3,
                  // color: Colors.green,
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: widget.ischangePosition == true
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.texttitle,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 15, color: Colors.white54),
                      ),
                      Text(
                        widget.textsubtitle,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 22,
                            foreground: Paint()
                              ..shader = AppColorPalette.white),
                      ),
                      CustomAnimation(
                        index: 12,
                        duration: const Duration(milliseconds: 1100),
                        horizontalOffset: 50.0,
                        child: Container(
                          //  height: Measures.getHeight(context) * 0.2,
                          width: Measures.getWidth(context) * 0.25,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 95, 36, 153)
                                  .withOpacity(0.3),
                              borderRadius: BorderRadius.circular(16.0)),
                          alignment: Alignment.center,
                          child: Text(
                            widget.textdesc,
                            textAlign: widget.ischangePosition == true
                                ? TextAlign.start
                                : TextAlign.end,
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
                      ),
                      Text(
                        widget.textend,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 14,
                              color: Colors.white54,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              MouseRegion(
                onEnter: (event) => _onprofile(true),
                onExit: (event) => _onprofile(false),
                child: CustomAnimation(
                  index: 12,
                  duration: const Duration(milliseconds: 1100),
                  horizontalOffset: 50.0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    transform: Matrix4.translationValues(
                        0, Variables.isprojects1 ? -20 : 0, 0),
                    height: Measures.getHeight(context) * 0.3,
                    width: Measures.getWidth(context) * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(16.0)),
                  ),
                ),
              ),
            ] else ...[
              MouseRegion(
                onEnter: (event) => _onprofile2(true),
                onExit: (event) => _onprofile2(false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(
                      0, Variables.isprojects2 ? -20 : 0, 0),
                  child: Container(
                    height: Measures.getHeight(context) * 0.3,
                    width: Measures.getWidth(context) * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(16.0)),
                  ),
                ),
              ),
              Container(
                height: Measures.getHeight(context) * 0.3,
                width: Measures.getWidth(context) * 0.3,
                // color: Colors.green,
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
                          .copyWith(fontSize: 15, color: Colors.white54),
                    ),
                    Text(
                      widget.textsubtitle,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 22,
                            foreground: Paint()..shader = AppColorPalette.white,
                          ),
                    ),
                    Container(
                      //  height: Measures.getHeight(context) * 0.2,
                      width: Measures.getWidth(context) * 0.25,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 95, 36, 153)
                              .withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16.0)),
                      alignment: Alignment.center,
                      child: Text(
                        widget.textdesc,
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 17,
                            color: const Color.fromARGB(255, 156, 156, 156),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      widget.textend,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14,
                            color: Colors.white54,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ])
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/App/Utils/Variables.dart';
import 'package:myportfolio/Views/Animations/animation.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';
import 'package:myportfolio/Views/Themes/Measures/measures.dart';

class TechStackSection extends StatefulWidget {
  final double? isVisible;
  Duration? duration;
  int? index;
  Key? techkeys;
  TechStackSection(
      {super.key,
      required this.isVisible,
      required this.index,
      required this.duration,
      required this.techkeys});

  @override
  State<TechStackSection> createState() => _TechStackSectionState();
}

class _TechStackSectionState extends State<TechStackSection> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: widget.isVisible!,
        duration: widget.duration!,
        child: Column(
          key: widget.techkeys,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAnimation(
              index: widget.index!,
              duration: const Duration(milliseconds: 700),
              verticalOffset: 50.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "06.",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 19,
                        foreground: Paint()
                          ..shader = AppColorPalette.textGradient),
                  ),
                  const SizedBox(width: 20.0),
                  Text(
                    "Tech Stack",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 22,
                        foreground: Paint()..shader = AppColorPalette.white),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
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
            const SizedBox(height: 20),
            Wrap(
              spacing: 70,
              runSpacing: 40,
              children: Variables.techStack.map((tech) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(tech["icon"],
                        size: 24,
                        color: const Color.fromARGB(255, 135, 24, 245)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "${tech["name"]} – ",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          children: [
                            TextSpan(
                              text: tech["desc"],
                              style: GoogleFonts.poppins(
                                  color: Colors.white54,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ));
  }
}

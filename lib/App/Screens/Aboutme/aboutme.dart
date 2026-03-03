// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:myportfolio/Views/Animations/animation.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// AboutMe  –  used for all breakpoints; picks layout internally
// MobileAboutMe is an alias kept for homecontent.dart compatibility
// ─────────────────────────────────────────────────────────────────────────────
class AboutMe extends StatefulWidget {
  final String txtno;
  final String title;
  final String descrption;
  final String? descrption2;
  final String? descrption3;
  final String? descrption4;
  final bool isprofile;
  final Duration duration;
  final Key? keys;
  final int index;
  final double? isVisible;

  const AboutMe({
    super.key,
    required this.txtno,
    required this.title,
    required this.descrption,
    this.descrption2,
    this.descrption3,
    this.keys,
    this.descrption4,
    required this.index,
    this.isVisible,
    required this.duration,
    required this.isprofile,
  });

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    final double vis = widget.isVisible ?? 0.0;
    return AnimatedOpacity(
      opacity: vis,
      duration: widget.duration,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          key: widget.keys,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Section header ────────────────────────────────────────
            if (vis != 0.0)
              CustomAnimation(
                duration: widget.duration,
                index: widget.index,
                horizontalOffset: 50.0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    children: [
                      Text(widget.txtno,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 19,
                                  foreground: Paint()
                                    ..shader = AppColorPalette.textGradient)),
                      const SizedBox(width: 20),
                      Flexible(
                        child: Text(widget.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 22,
                                    foreground: Paint()
                                      ..shader = AppColorPalette.white)),
                      ),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Divider(height: 0.3, color: Colors.white60),
                      ),
                    ],
                  ),
                ),
              ),
            // ── Body text only (NO profile image in About section) ───
            if (vis != 0.0)
              CustomAnimation(
                duration: const Duration(milliseconds: 800),
                index: widget.index,
                horizontalOffset: 50.0,
                child: _AboutTextContent(widget: widget),
              ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Text content widget
// ─────────────────────────────────────────────────────────────────────────────
class _AboutTextContent extends StatelessWidget {
  final AboutMe widget;
  const _AboutTextContent({required this.widget});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final double fs = sw < 480 ? 14 : sw < 768 ? 15 : 17;
    final double maxW = sw < 600 ? double.infinity : sw * 0.55;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxW),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.descrption,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: fs,
                  color: Colors.white60,
                  height: 1.7,
                ),
          ),
          if (widget.descrption2 != null && widget.descrption2!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(widget.descrption2!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: fs,
                      color: Colors.white60,
                      height: 1.7,
                    )),
          ],
          const SizedBox(height: 18),
          // Highlight line (descrption3 == "" triggers "I have Deployed..." line)
          if (widget.descrption3 == '')
            Wrap(spacing: 6, children: [
              Text("I have Deployed ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: fs, color: Colors.white60)),
              Text("Scalable Cloud Infrastructure",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: fs + 2,
                        fontWeight: FontWeight.w600,
                        foreground: Paint()
                          ..shader = AppColorPalette.textGradient,
                      )),
            ])
          else if (widget.descrption3 != null &&
              widget.descrption3!.isNotEmpty)
            Text(widget.descrption3!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: fs + 2,
                      fontWeight: FontWeight.w600,
                      foreground: Paint()
                        ..shader = AppColorPalette.textGradient,
                    )),
          const SizedBox(height: 14),
          if (widget.descrption4 != null && widget.descrption4!.isNotEmpty)
            Text(widget.descrption4!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: fs,
                      foreground: Paint()..shader = AppColorPalette.white,
                    )),
        ],
      ),
    );
  }
}

// Alias kept so homecontent.dart doesn't need changes
class MobileAboutMe extends AboutMe {
  const MobileAboutMe({
    super.key,
    required super.txtno,
    required super.title,
    required super.descrption,
    super.descrption2,
    super.descrption3,
    super.keys,
    super.descrption4,
    required super.index,
    super.isVisible,
    required super.duration,
    required super.isprofile,
  });
}

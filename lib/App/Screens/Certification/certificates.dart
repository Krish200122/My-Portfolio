// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/App/Utils/Variables.dart';
import 'package:myportfolio/Views/Animations/animation.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';
import 'package:myportfolio/Views/Themes/Measures/measures.dart';
import 'package:url_launcher/url_launcher.dart';

// ─── shared badge dimensions ───────────────────────────────────────────────────
// Both AZ-204 and AZ-400 badges use IDENTICAL sizing so they appear equal.
// Change _badgeSize to scale both at once.
double _badgeWidth(BuildContext context) =>
    Measures.getWidth(context) * 0.28;
double _badgeHeight(BuildContext context) =>
    Measures.getHeight(context) * 0.32;

// ─── Desktop Certification ─────────────────────────────────────────────────────
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

  Certification({
    super.key,
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
    this.ischangePosition = false,
  });

  @override
  State<Certification> createState() => _CertificationState();
}

class _CertificationState extends State<Certification> {
  bool _hovered = false;

  void _onHover(bool v) => setState(() => _hovered = v);

  // ── shared badge widget — identical for both certs ─────────────────────────
  Widget _badge({
    required BuildContext context,
    required String assetPath,
    required bool isHovered,
    required VoidCallback onTap,
    required void Function(bool) onHover,
    required String hoverLabel,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: GestureDetector(
        onTap: onTap,
        child: CustomAnimation(
          index: widget.index!,
          duration: widget.duration!,
          horizontalOffset: 50.0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.translationValues(
                    0, isHovered ? -20 : 0, 0),
                // ✅ Both badges: same width, same height, same BoxFit
                width: _badgeWidth(context),
                height: _badgeHeight(context),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(assetPath),
                    fit: BoxFit.contain, // same for both
                  ),
                ),
                foregroundDecoration: BoxDecoration(
                  color: isHovered
                      ? Colors.black.withOpacity(0.75)
                      : Colors.transparent,
                ),
              ),
              if (isHovered)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    hoverLabel,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      foreground: Paint()..shader = AppColorPalette.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
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
            // Section header
            if (widget.isVisible! != 0)
              CustomAnimation(
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
                              letterSpacing: 1.5,
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
                              letterSpacing: 0.4,
                              foreground: Paint()
                                ..shader = AppColorPalette.white),
                    ),
                    const SizedBox(width: 30.0),
                    if (widget.textno != "" && widget.texttitle != "")
                      SizedBox(
                        width: Measures.getWidth(context) * 0.1,
                        child: const Divider(
                            height: 0.3, color: Colors.white60),
                      ),
                  ],
                ),
              )
            else
              const SizedBox.shrink(),

            const SizedBox(height: 20.0),

            // Body
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.ischangePosition) ...[
                  // TEXT LEFT | BADGE RIGHT  (AZ-400)
                  if (widget.isVisible! != 0)
                    CustomAnimation(
                      index: widget.index!,
                      duration: widget.duration!,
                      horizontalOffset: -50.0,
                      child: _CertTextBlock(
                        context: context,
                        width: Measures.getWidth(context) * 0.35,
                        texttitle: widget.texttitle,
                        textsubtitle: widget.textsubtitle,
                        textdesc: widget.textdesc,
                        textend: widget.textend,
                        alignEnd: false,
                      ),
                    ),
                  if (widget.isVisible! != 0)
                    _badge(
                      context: context,
                      assetPath:
                          "Assets/Images/CERT-Expert-DevOps-Engineer-600x600.png",
                      isHovered: Variables.iscertificate1,
                      hoverLabel: "Explore My AZ-400 Certification",
                      onHover: (v) =>
                          setState(() => Variables.iscertificate1 = v),
                      onTap: () async {
                        final url = Uri.parse(
                            "https://learn.microsoft.com/api/credentials/share/en-us/TarunKrishna-8878/AEA48F7A80C874EB?sharingId=15C466BCFBAB71DD");
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                    ),
                ] else ...[
                  // BADGE LEFT | TEXT RIGHT  (AZ-204)
                  if (widget.isVisible! != 0)
                    _badge(
                      context: context,
                      assetPath:
                          "Assets/Images/azure-developer-associate-600x600-1.png",
                      isHovered: Variables.iscertificate2,
                      hoverLabel: "Explore My AZ-204 Certification",
                      onHover: (v) =>
                          setState(() => Variables.iscertificate2 = v),
                      onTap: () async {
                        final url = Uri.parse(
                            "https://learn.microsoft.com/api/credentials/share/en-us/TarunKrishna-8878/FE428A667ED49C58?sharingId=15C466BCFBAB71DD");
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                    ),
                  if (widget.isVisible! != 0)
                    CustomAnimation(
                      index: widget.index!,
                      duration: widget.duration!,
                      horizontalOffset: 50.0,
                      child: _CertTextBlock(
                        context: context,
                        width: Measures.getWidth(context) * 0.35,
                        texttitle: widget.texttitle,
                        textsubtitle: widget.textsubtitle,
                        textdesc: widget.textdesc,
                        textend: widget.textend,
                        alignEnd: true,
                      ),
                    ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Shared text block ─────────────────────────────────────────────────────────
class _CertTextBlock extends StatelessWidget {
  final BuildContext context;
  final double width;
  final String texttitle, textsubtitle, textdesc, textend;
  final bool alignEnd;

  const _CertTextBlock({
    required this.context,
    required this.width,
    required this.texttitle,
    required this.textsubtitle,
    required this.textdesc,
    required this.textend,
    required this.alignEnd,
  });

  @override
  Widget build(BuildContext ctx) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            texttitle,
            style: Theme.of(ctx).textTheme.titleSmall!.copyWith(
                  fontSize: 13,
                  color: const Color(0xFF7B61FF),
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            textsubtitle,
            textAlign: alignEnd ? TextAlign.end : TextAlign.start,
            style: Theme.of(ctx).textTheme.titleSmall!.copyWith(
                  fontSize: 22,
                  letterSpacing: -0.2,
                  height: 1.25,
                  foreground: Paint()..shader = AppColorPalette.white,
                ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color:
                  const Color.fromARGB(255, 95, 36, 153).withOpacity(0.3),
              borderRadius: BorderRadius.circular(16.0),
            ),
            alignment: Alignment.center,
            child: Text(
              textdesc,
              textAlign: alignEnd ? TextAlign.end : TextAlign.start,
              style: Theme.of(ctx).textTheme.titleSmall!.copyWith(
                    fontSize: 15,
                    height: 1.65,
                    letterSpacing: 0.15,
                    color: const Color.fromARGB(255, 156, 156, 156),
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            textend,
            textAlign: alignEnd ? TextAlign.end : TextAlign.start,
            style: Theme.of(ctx).textTheme.titleSmall!.copyWith(
                  fontSize: 13,
                  color: Colors.white38,
                  letterSpacing: 0.4,
                  height: 1.8,
                ),
          ),
        ],
      ),
    );
  }
}

// ─── Mobile MobileViewCertificate ─────────────────────────────────────────────
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

  MobileViewCertificate({
    super.key,
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
    this.ischangePosition = false,
  });

  @override
  State<MobileViewCertificate> createState() =>
      _MobileViewCertificateState();
}

class _MobileViewCertificateState extends State<MobileViewCertificate> {
  @override
  Widget build(BuildContext context) {
    final w = Measures.getWidth(context);
    final hPad = w * 0.045;

    // ✅ Both mobile badges: same fixed size — centered, equal
    const double mobileBadgeSize = 220.0;

    return AnimatedOpacity(
      opacity: widget.isVisible!,
      duration: widget.duration!,
      child: Padding(
        padding: EdgeInsets.fromLTRB(hPad, 16, hPad, 0),
        child: Column(
          key: widget.keys,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section header
            if (widget.isVisible! != 0)
              CustomAnimation(
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
                              fontSize: 16,
                              letterSpacing: 1.5,
                              foreground: Paint()
                                ..shader = AppColorPalette.textGradient),
                    ),
                    const SizedBox(width: 16.0),
                    Flexible(
                      child: Text(
                        widget.title!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(
                                fontSize: 16,
                                letterSpacing: 0.4,
                                foreground: Paint()
                                  ..shader = AppColorPalette.white),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    if (widget.textno != "" && widget.texttitle != "")
                      SizedBox(
                        width: w * 0.08,
                        child: const Divider(
                            height: 0.3, color: Colors.white60),
                      ),
                  ],
                ),
              ),

            const SizedBox(height: 28.0),

            if (widget.ischangePosition) ...[
              // ── AZ-400 ── text first, then badge centred ─────────────────
              if (widget.isVisible! != 0)
                CustomAnimation(
                  index: widget.index!,
                  duration: widget.duration!,
                  horizontalOffset: 30.0,
                  child: _MobileCertText(
                    texttitle: widget.texttitle,
                    textsubtitle: widget.textsubtitle,
                    textdesc: widget.textdesc,
                    textend: widget.textend,
                    certLabel: "AZ-400",
                    certUrl:
                        "https://learn.microsoft.com/api/credentials/share/en-us/TarunKrishna-8878/AEA48F7A80C874EB?sharingId=15C466BCFBAB71DD",
                  ),
                ),
              const SizedBox(height: 20),
              // ✅ centred badge, fixed square size
              Center(
                child: CustomAnimation(
                  index: widget.index!,
                  duration: widget.duration!,
                  horizontalOffset: 30.0,
                  child: SizedBox(
                    width: mobileBadgeSize,
                    height: mobileBadgeSize,
                    child: Image.asset(
                      "Assets/Images/CERT-Expert-DevOps-Engineer-600x600.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ] else ...[
              // ── AZ-204 ── badge centred first, then text ──────────────────
              // ✅ same size as AZ-400 above
              Center(
                child: CustomAnimation(
                  index: widget.index!,
                  duration: widget.duration!,
                  horizontalOffset: 30.0,
                  child: SizedBox(
                    width: mobileBadgeSize,
                    height: mobileBadgeSize,
                    child: Image.asset(
                      "Assets/Images/azure-developer-associate-600x600-1.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (widget.isVisible! != 0)
                CustomAnimation(
                  index: widget.index!,
                  duration: widget.duration!,
                  horizontalOffset: 30.0,
                  child: _MobileCertText(
                    texttitle: widget.texttitle,
                    textsubtitle: widget.textsubtitle,
                    textdesc: widget.textdesc,
                    textend: widget.textend,
                    certLabel: "AZ-204",
                    certUrl:
                        "https://learn.microsoft.com/api/credentials/share/en-us/TarunKrishna-8878/FE428A667ED49C58?sharingId=15C466BCFBAB71DD",
                  ),
                ),
            ],

            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}

// ─── Mobile cert text block ────────────────────────────────────────────────────
class _MobileCertText extends StatelessWidget {
  final String texttitle, textsubtitle, textdesc, textend;
  final String certLabel, certUrl;

  const _MobileCertText({
    required this.texttitle,
    required this.textsubtitle,
    required this.textdesc,
    required this.textend,
    required this.certLabel,
    required this.certUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          texttitle,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 11,
            color: const Color(0xFF7B61FF),
            letterSpacing: 2.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          textsubtitle,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 18,
                letterSpacing: -0.2,
                height: 1.25,
                fontWeight: FontWeight.w700,
                foreground: Paint()..shader = AppColorPalette.white,
              ),
        ),
        const SizedBox(height: 14),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color:
                const Color.fromARGB(255, 95, 36, 153).withOpacity(0.3),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Text(
            textdesc,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 14,
                  height: 1.7,
                  letterSpacing: 0.15,
                  color: const Color.fromARGB(255, 156, 156, 156),
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          textend,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 11,
            color: Colors.white30,
            letterSpacing: 0.4,
            height: 2.0,
          ),
        ),
        const SizedBox(height: 14),
        GestureDetector(
          onTap: () async {
            final url = Uri.parse(certUrl);
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.open_in_new_rounded,
                  color: Colors.white54, size: 14),
              const SizedBox(width: 6),
              Text(
                "My $certLabel Certification",
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 12,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
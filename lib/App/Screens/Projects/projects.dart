// ignore_for_file: camel_case_types, deprecated_member_use

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/App/Utils/Variables.dart';
import 'package:myportfolio/Views/Animations/animation.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';
import 'package:myportfolio/Views/Themes/Measures/measures.dart';
import 'package:url_launcher/url_launcher.dart';

// ═══════════════════════════════════════════════════════════════════════════════
//  PROJECT CARD TYPES
// ═══════════════════════════════════════════════════════════════════════════════

enum ProjectCardType { cicd, kubernetes }

// ═══════════════════════════════════════════════════════════════════════════════
//  HELPERS
// ═══════════════════════════════════════════════════════════════════════════════

Widget _trafficDot(Color c) => Container(
    width: 11,
    height: 11,
    decoration: BoxDecoration(color: c, shape: BoxShape.circle));

// ═══════════════════════════════════════════════════════════════════════════════
//  CI/CD PIPELINE CARD
//  Key fix: Column uses mainAxisSize.min + no Spacer so it never overflows.
//  The outer SizedBox constrains height — content shrinks inside via spacing.
// ═══════════════════════════════════════════════════════════════════════════════

class _CICDPipelineCard extends StatefulWidget {
  const _CICDPipelineCard();
  @override
  State<_CICDPipelineCard> createState() => _CICDPipelineCardState();
}

class _CICDPipelineCardState extends State<_CICDPipelineCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _ctrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);
    _pulse = Tween<double>(begin: 0.35, end: 1.0)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  static const _stages = [
    ("BUILD",   true,  "Docker image pushed",    Color(0xFF28CA41)),
    ("SAST",    true,  "0 critical findings",    Color(0xFF28CA41)),
    ("TEST",    true,  "142 passed · 0 failed",  Color(0xFF28CA41)),
    ("STAGING", true,  "Deployed to QA",         Color(0xFFFFBD2E)),
    ("PROD",    false, "Awaiting approval gate",  Color(0xFF7B61FF)),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // Distribute available height proportionally
      final availH = constraints.maxHeight;
      // stage row height ≈ available minus chrome(36) minus envflow(44) minus gaps
      final stageGap = math.max(4.0, (availH - 36 - 44 - 32) / _stages.length - 22);

      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF090B10),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
              color: const Color(0xFF7B61FF).withOpacity(0.35), width: 1.2),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF7B61FF).withOpacity(0.14),
                blurRadius: 36,
                spreadRadius: 2),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          // ✅ Use Column with mainAxisAlignment.spaceBetween so content
          //    fills available height without overflowing
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── window chrome ───────────────────────────────────────────
            Row(children: [
              _trafficDot(const Color(0xFFFF5F57)),
              const SizedBox(width: 6),
              _trafficDot(const Color(0xFFFFBD2E)),
              const SizedBox(width: 6),
              _trafficDot(const Color(0xFF28CA41)),
              const SizedBox(width: 10),
              Flexible(
                child: Text("azure-pipelines.yml",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.jetBrainsMono(
                        fontSize: 10,
                        color: Colors.white24,
                        letterSpacing: 0.4)),
              ),
              const SizedBox(width: 8),
              AnimatedBuilder(
                animation: _pulse,
                builder: (_, __) => Opacity(
                  opacity: _pulse.value,
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                            color: Color(0xFF28CA41),
                            shape: BoxShape.circle)),
                    const SizedBox(width: 4),
                    Text("LIVE",
                        style: GoogleFonts.jetBrainsMono(
                            fontSize: 10,
                            color: const Color(0xFF28CA41),
                            letterSpacing: 1.5)),
                  ]),
                ),
              ),
            ]),

            // ── pipeline stages ─────────────────────────────────────────
            // Wrap in Expanded so stages fill remaining space evenly
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _stages.map((s) {
                    final (label, done, sub, color) = s;
                    return Row(children: [
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: done
                              ? color.withOpacity(0.15)
                              : Colors.white.withOpacity(0.04),
                          border: Border.all(
                              color: color.withOpacity(0.6), width: 1.1),
                        ),
                        child: Icon(
                          done
                              ? Icons.check_rounded
                              : Icons.hourglass_top_rounded,
                          size: 12,
                          color: color,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(label,
                                style: GoogleFonts.jetBrainsMono(
                                    fontSize: 11,
                                    color: Colors.white70,
                                    letterSpacing: 1.0)),
                            Text(sub,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.jetBrainsMono(
                                    fontSize: 9,
                                    color: color.withOpacity(0.7),
                                    letterSpacing: 0.3)),
                          ],
                        ),
                      ),
                    ]);
                  }).toList(),
                ),
              ),
            ),

            // ── env flow ────────────────────────────────────────────────
            _EnvFlow(),
          ],
        ),
      );
    });
  }
}

class _EnvFlow extends StatelessWidget {
  static const _envs = ["DEV", "QA", "STAGING", "PROD"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(_envs.length * 2 - 1, (i) {
        if (i.isOdd) {
          return const Icon(Icons.arrow_forward_ios_rounded,
              color: Colors.white12, size: 9);
        }
        final idx = i ~/ 2;
        final isActive = idx < 3;
        final color =
            isActive ? const Color(0xFF28CA41) : const Color(0xFF7B61FF);
        return Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: color.withOpacity(0.4)),
            ),
            child: Text(_envs[idx],
                textAlign: TextAlign.center,
                style: GoogleFonts.jetBrainsMono(
                    fontSize: 10, color: color, letterSpacing: 0.8)),
          ),
        );
      }),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
//  KUBERNETES CLUSTER CARD
// ═══════════════════════════════════════════════════════════════════════════════

class _KubernetesClusterCard extends StatefulWidget {
  const _KubernetesClusterCard();
  @override
  State<_KubernetesClusterCard> createState() =>
      _KubernetesClusterCardState();
}

class _KubernetesClusterCardState extends State<_KubernetesClusterCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF05080F),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
            color: const Color(0xFF326CE5).withOpacity(0.4), width: 1.2),
        boxShadow: [
          BoxShadow(
              color: const Color(0xFF326CE5).withOpacity(0.12),
              blurRadius: 36,
              spreadRadius: 2),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: const Color(0xFF326CE5).withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                    color: const Color(0xFF326CE5).withOpacity(0.4)),
              ),
              child: const Icon(Icons.hub_rounded,
                  color: Color(0xFF326CE5), size: 16),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("aks-prod-cluster",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.jetBrainsMono(
                            fontSize: 12,
                            color: Colors.white,
                            letterSpacing: 0.3)),
                    Text("12 nodes · Azure AKS",
                        style: GoogleFonts.jetBrainsMono(
                            fontSize: 9,
                            color: Colors.white38,
                            letterSpacing: 0.2)),
                  ]),
            ),
            AnimatedBuilder(
              animation: _ctrl,
              builder: (_, __) => Transform.rotate(
                angle: _ctrl.value * 2 * math.pi,
                child: const Icon(Icons.settings_rounded,
                    color: Color(0xFF326CE5), size: 16),
              ),
            ),
          ]),

          // Pods
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("PODS  (12/12 running)",
                  style: GoogleFonts.jetBrainsMono(
                      fontSize: 9,
                      color: Colors.white24,
                      letterSpacing: 1.2)),
              const SizedBox(height: 7),
              _PodGrid(),
            ],
          ),

          // Metrics
          Row(children: [
            Expanded(
                child:
                    _MetricChip("CPU", "34%", const Color(0xFF326CE5))),
            const SizedBox(width: 7),
            Expanded(
                child:
                    _MetricChip("MEM", "62%", const Color(0xFF00D4AA))),
            const SizedBox(width: 7),
            Expanded(
                child:
                    _MetricChip("MTTR", "-40%", const Color(0xFFFFBD2E))),
          ]),

          // Services
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("SERVICES",
                  style: GoogleFonts.jetBrainsMono(
                      fontSize: 9,
                      color: Colors.white24,
                      letterSpacing: 1.2)),
              const SizedBox(height: 6),
              Wrap(
                spacing: 5,
                runSpacing: 4,
                children: [
                  "nginx-ingress",
                  "prometheus",
                  "grafana",
                  "cert-manager",
                  "pagerduty",
                ]
                    .map((s) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFF326CE5).withOpacity(0.08),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: const Color(0xFF326CE5)
                                    .withOpacity(0.25)),
                          ),
                          child: Text(s,
                              style: GoogleFonts.jetBrainsMono(
                                  fontSize: 9,
                                  color: const Color(0xFF326CE5)
                                      .withOpacity(0.9),
                                  letterSpacing: 0.3)),
                        ))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PodGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: List.generate(12, (i) {
        final ok = i < 11;
        final color =
            ok ? const Color(0xFF28CA41) : const Color(0xFFFFBD2E);
        return Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: color.withOpacity(0.5), width: 1),
          ),
          child: Center(
            child: Container(
                width: 6,
                height: 6,
                decoration:
                    BoxDecoration(color: color, shape: BoxShape.circle)),
          ),
        );
      }),
    );
  }
}

class _MetricChip extends StatelessWidget {
  final String label, value;
  final Color color;
  const _MetricChip(this.label, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.07),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        FittedBox(
          child: Text(value,
              style: GoogleFonts.jetBrainsMono(
                  fontSize: 14,
                  color: color,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5)),
        ),
        Text(label,
            style: GoogleFonts.jetBrainsMono(
                fontSize: 9,
                color: color.withOpacity(0.6),
                letterSpacing: 1.0)),
      ]),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
//  CARD SELECTOR
// ═══════════════════════════════════════════════════════════════════════════════

Widget _buildVisualCard(ProjectCardType type) {
  switch (type) {
    case ProjectCardType.cicd:
      return const _CICDPipelineCard();
    case ProjectCardType.kubernetes:
      return const _KubernetesClusterCard();
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
//  SHARED — section header
// ═══════════════════════════════════════════════════════════════════════════════

class _SectionHeader extends StatelessWidget {
  final String textno, title, texttitle;
  final double dividerWidth;
  final double numberSize, titleSize;

  const _SectionHeader({
    required this.textno,
    required this.title,
    required this.texttitle,
    required this.dividerWidth,
    this.numberSize = 19,
    this.titleSize = 22,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(textno,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: numberSize,
                letterSpacing: 1.5,
                foreground:
                    Paint()..shader = AppColorPalette.textGradient)),
        const SizedBox(width: 16),
        Flexible(
          child: Text(title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: titleSize,
                  letterSpacing: 0.4,
                  foreground: Paint()..shader = AppColorPalette.white)),
        ),
        const SizedBox(width: 20),
        if (textno.isNotEmpty && texttitle.isNotEmpty)
          SizedBox(
              width: dividerWidth,
              child:
                  const Divider(height: 0.3, color: Colors.white60)),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
//  SHARED — project text block
// ═══════════════════════════════════════════════════════════════════════════════

class _ProjectTextBlock extends StatelessWidget {
  final double? width;
  final String texttitle, textsubtitle, textdesc, textend;
  final bool alignEnd, showGithubLink;

  const _ProjectTextBlock({
    this.width,
    required this.texttitle,
    required this.textsubtitle,
    required this.textdesc,
    required this.textend,
    required this.alignEnd,
    required this.showGithubLink,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          crossAxisAlignment:
              alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Featured label
            Text(texttitle,
                style: GoogleFonts.jetBrainsMono(
                    fontSize: 12,
                    color: const Color(0xFF7B61FF),
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),

            // Title
            Text(textsubtitle,
                textAlign: alignEnd ? TextAlign.end : TextAlign.start,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 22,
                    letterSpacing: -0.3,
                    height: 1.25,
                    fontWeight: FontWeight.w700,
                    foreground: Paint()..shader = AppColorPalette.white)),
            const SizedBox(height: 16),

            // Desc card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF7B61FF).withOpacity(0.07),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: const Color(0xFF7B61FF).withOpacity(0.28),
                    width: 1.2),
              ),
              child: Text(textdesc,
                  textAlign: alignEnd ? TextAlign.end : TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14,
                      height: 1.7,
                      letterSpacing: 0.15,
                      color: const Color(0xFFB8B8C8),
                      fontWeight: FontWeight.w400)),
            ),
            const SizedBox(height: 12),

            // Tech stack
            Text(textend,
                textAlign: alignEnd ? TextAlign.end : TextAlign.start,
                style: GoogleFonts.jetBrainsMono(
                    fontSize: 12,
                    color: Colors.white30,
                    letterSpacing: 0.4,
                    height: 1.9)),

            if (showGithubLink) ...[
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () async {
                  final url =
                      Uri.parse("https://github.com/Krish200122");
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url,
                        mode: LaunchMode.externalApplication);
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.code_rounded,
                        color: Colors.white54, size: 15),
                    const SizedBox(width: 6),
                    Text("View on GitHub",
                        style: GoogleFonts.jetBrainsMono(
                            fontSize: 12,
                            color: Colors.white54,
                            letterSpacing: 0.8,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white30)),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
//  DESKTOP — projects widget
// ═══════════════════════════════════════════════════════════════════════════════

class projects extends StatelessWidget {
  final String? textno;
  final String texttitle;
  final Key? keys;
  final String textsubtitle;
  final String textdesc;
  final String textend;
  final String? title;
  final Duration? duration;
  final double? isVisible;
  final int? index;
  final bool ischangePosition;
  final ProjectCardType cardType;

  const projects({
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
    this.cardType = ProjectCardType.cicd,
  });

  @override
  Widget build(BuildContext context) {
    final w = Measures.getWidth(context);
    final h = Measures.getHeight(context);

    // ✅ Card height is capped — never taller than viewport allows
    final cardH = math.min(h * 0.43, 400.0);
    final cardW = w * 0.33;
    final textW = w * 0.36;

    return AnimatedOpacity(
      opacity: isVisible!,
      duration: duration!,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          key: keys,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isVisible! != 0)
              CustomAnimation(
                index: index!,
                duration: duration!,
                verticalOffset: 50.0,
                child: _SectionHeader(
                  textno: textno!,
                  title: title!,
                  texttitle: texttitle,
                  dividerWidth: w * 0.08,
                ),
              ),

            const SizedBox(height: 24),

            if (isVisible! != 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: ischangePosition
                    ? [
                        // TEXT  |  CARD
                        CustomAnimation(
                          index: index!,
                          duration: duration!,
                          horizontalOffset: -50.0,
                          child: _ProjectTextBlock(
                            width: textW,
                            texttitle: texttitle,
                            textsubtitle: textsubtitle,
                            textdesc: textdesc,
                            textend: textend,
                            alignEnd: false,
                            showGithubLink: true,
                          ),
                        ),
                        CustomAnimation(
                          index: index!,
                          duration: duration!,
                          horizontalOffset: 50.0,
                          child: SizedBox(
                            width: cardW,
                            height: cardH,
                            child: _buildVisualCard(cardType),
                          ),
                        ),
                      ]
                    : [
                        // CARD  |  TEXT
                        CustomAnimation(
                          index: index!,
                          duration: duration!,
                          horizontalOffset: -50.0,
                          child: SizedBox(
                            width: cardW,
                            height: cardH,
                            child: _buildVisualCard(cardType),
                          ),
                        ),
                        CustomAnimation(
                          index: index!,
                          duration: duration!,
                          horizontalOffset: 50.0,
                          child: _ProjectTextBlock(
                            width: textW,
                            texttitle: texttitle,
                            textsubtitle: textsubtitle,
                            textdesc: textdesc,
                            textend: textend,
                            alignEnd: true,
                            showGithubLink: false,
                          ),
                        ),
                      ],
              ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
//  MOBILE — MobileViewProjects
//  All paddings are percentage-based. Card uses fixed 260px height (safe).
// ═══════════════════════════════════════════════════════════════════════════════

class MobileViewProjects extends StatelessWidget {
  final String? textno;
  final String texttitle;
  final Key? keys;
  final String textsubtitle;
  final String textdesc;
  final String textend;
  final String? title;
  final Duration? duration;
  final double? isVisible;
  final int? index;
  final bool ischangePosition;
  final ProjectCardType cardType;

  const MobileViewProjects({
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
    this.cardType = ProjectCardType.cicd,
  });

  @override
  Widget build(BuildContext context) {
    final w = Measures.getWidth(context);

    // ✅ Percentage-based padding — scales on all screen sizes
    final hPad = w * 0.045;

    // ✅ Card height scales with screen width, capped to avoid overflow
    final cardH = math.min(w * 0.78, 280.0);

    return AnimatedOpacity(
      opacity: isVisible!,
      duration: duration!,
      child: Padding(
        padding: EdgeInsets.fromLTRB(hPad, 16, hPad, 0),
        child: Column(
          key: keys,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Section header
            if (isVisible! != 0)
              CustomAnimation(
                index: index!,
                duration: duration!,
                verticalOffset: 50.0,
                child: _SectionHeader(
                  textno: textno!,
                  title: title!,
                  texttitle: texttitle,
                  dividerWidth: w * 0.06,
                  numberSize: 15,
                  titleSize: 15,
                ),
              ),

            const SizedBox(height: 20),

            // Featured label
            Text(texttitle,
                style: GoogleFonts.jetBrainsMono(
                    fontSize: 11,
                    color: const Color(0xFF7B61FF),
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),

            // Project title
            Text(textsubtitle,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 18,
                    letterSpacing: -0.2,
                    height: 1.25,
                    fontWeight: FontWeight.w700,
                    foreground:
                        Paint()..shader = AppColorPalette.white)),

            const SizedBox(height: 16),

            // ✅ Visual card — width fills available space, height is capped
            if (isVisible! != 0)
              CustomAnimation(
                index: index!,
                duration: duration!,
                horizontalOffset: 30.0,
                child: SizedBox(
                  width: double.infinity,
                  height: cardH,
                  child: _buildVisualCard(cardType),
                ),
              ),

            const SizedBox(height: 14),

            // Description
            if (isVisible! != 0)
              CustomAnimation(
                index: index!,
                duration: duration!,
                horizontalOffset: 30.0,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7B61FF).withOpacity(0.07),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                        color:
                            const Color(0xFF7B61FF).withOpacity(0.28),
                        width: 1.2),
                  ),
                  child: Text(textdesc,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                              fontSize: 13,
                              height: 1.7,
                              letterSpacing: 0.15,
                              color: const Color(0xFFB8B8C8),
                              fontWeight: FontWeight.w400)),
                ),
              ),

            const SizedBox(height: 12),

            // Tech stack
            Text(textend,
                style: GoogleFonts.jetBrainsMono(
                    fontSize: 11,
                    color: Colors.white30,
                    letterSpacing: 0.4,
                    height: 2.0)),

            // GitHub link
            if (ischangePosition) ...[
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () async {
                  final url =
                      Uri.parse("https://github.com/Krish200122");
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url,
                        mode: LaunchMode.externalApplication);
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.code_rounded,
                        color: Colors.white54, size: 15),
                    const SizedBox(width: 6),
                    Text("GitHub – ",
                        style: GoogleFonts.jetBrainsMono(
                            fontSize: 12,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            letterSpacing: 0.5)),
                    Text("Krish200122",
                        style: GoogleFonts.jetBrainsMono(
                            fontSize: 12,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            letterSpacing: 0.5)),
                  ],
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
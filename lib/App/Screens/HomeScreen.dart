// ignore_for_file: file_names, deprecated_member_use

import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myportfolio/App/Screens/HomeContent/homecontent.dart';
import 'package:myportfolio/App/Utils/Variables.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';
import 'package:myportfolio/Views/Themes/Icons/icons.dart';
import 'package:myportfolio/Views/Themes/Measures/measures.dart';
import 'package:myportfolio/Views/Animations/animation.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

// ═══════════════════════════════════════════════════════════════════════════════
//  LOOPING TYPEWRITER ENGINE
//  Reusable — drives both the logo and the name animation
// ═══════════════════════════════════════════════════════════════════════════════

class _LoopingTypewriter extends StatefulWidget {
  /// List of strings to cycle through one by one
  final List<String> texts;

  /// How fast each character appears (ms)
  final int charDelayMs;

  /// How fast each character is deleted (ms)
  final int deleteDelayMs;

  /// Pause after fully typed before deleting (ms)
  final int pauseAfterMs;

  /// Pause after fully deleted before next word (ms)
  final int pauseBeforeMs;

  /// Initial delay before starting (ms)
  final int startDelayMs;

  /// Builder so caller controls styling
  final Widget Function(BuildContext context, String visible, bool showCursor)
      builder;

  const _LoopingTypewriter({
    required this.texts,
    required this.builder,
    this.charDelayMs = 100,
    this.deleteDelayMs = 60,
    this.pauseAfterMs = 1400,
    this.pauseBeforeMs = 400,
    this.startDelayMs = 300,
  });

  @override
  State<_LoopingTypewriter> createState() => _LoopingTypewriterState();
}

class _LoopingTypewriterState extends State<_LoopingTypewriter>
    with SingleTickerProviderStateMixin {
  int _textIndex = 0;
  int _charCount = 0;
  bool _deleting = false;
  bool _showCursor = true;
  Timer? _typeTimer;
  late AnimationController _cursorCtrl;

  @override
  void initState() {
    super.initState();
    // cursor blink
    _cursorCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 530))
      ..addStatusListener((_) {
        if (mounted) setState(() => _showCursor = !_showCursor);
      })
      ..repeat();

    Future.delayed(Duration(milliseconds: widget.startDelayMs), _tick);
  }

  String get _currentText => widget.texts[_textIndex];

  void _tick() {
    if (!mounted) return;

    if (!_deleting) {
      // ── typing forward ──────────────────────────────────────────────
      if (_charCount < _currentText.length) {
        setState(() => _charCount++);
        _typeTimer = Timer(Duration(milliseconds: widget.charDelayMs), _tick);
      } else {
        // fully typed — pause then start deleting
        _typeTimer = Timer(Duration(milliseconds: widget.pauseAfterMs), () {
          if (mounted) setState(() => _deleting = true);
          _tick();
        });
      }
    } else {
      // ── deleting backward ───────────────────────────────────────────
      if (_charCount > 0) {
        setState(() => _charCount--);
        _typeTimer = Timer(Duration(milliseconds: widget.deleteDelayMs), _tick);
      } else {
        // fully deleted — move to next text, pause then start typing
        _typeTimer = Timer(Duration(milliseconds: widget.pauseBeforeMs), () {
          if (mounted) {
            setState(() {
              _deleting = false;
              _textIndex = (_textIndex + 1) % widget.texts.length;
            });
          }
          _tick();
        });
      }
    }
  }

  @override
  void dispose() {
    _typeTimer?.cancel();
    _cursorCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final visible = _currentText.substring(0, _charCount);
    return widget.builder(context, visible, _showCursor);
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
//  LOOPING TYPEWRITER LOGO  —  "Krish.com"
// ═══════════════════════════════════════════════════════════════════════════════

class _TypewriterLogo extends StatelessWidget {
  const _TypewriterLogo();

  @override
  Widget build(BuildContext context) {
    final sw = ResponsiveWrapper.of(context).screenWidth;
    final fontSize = sw < 480
        ? 20.0
        : sw < 768
            ? 24.0
            : sw < 1024
                ? 26.0
                : sw < 1440
                    ? 28.0
                    : 30.0;

    return _LoopingTypewriter(
      texts: const ["Krish"],
      charDelayMs: 110,
      deleteDelayMs: 70,
      pauseAfterMs: 2000,
      pauseBeforeMs: 400,
      startDelayMs: 400,
      builder: (context, visible, showCursor) {
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: visible,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: fontSize,
                      foreground: Paint()
                        ..shader = AppColorPalette.textGradient,
                    ),
              ),
              // blinking cursor
              TextSpan(
                text: showCursor ? "|" : " ",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: fontSize,
                      foreground: Paint()
                        ..shader = AppColorPalette.textGradient,
                    ),
              ),
              // .com always visible
              TextSpan(
                text: ".com",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 13,
                      foreground: Paint()..shader = AppColorPalette.white,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
//  LOOPING TYPEWRITER NAME  —  "TARUN KRISHNA"
//  Export this and use it in your HomeContent widget
// ═══════════════════════════════════════════════════════════════════════════════

class TypewriterName extends StatelessWidget {
  final double fontSize;
  const TypewriterName({super.key, this.fontSize = 58.0});

  @override
  Widget build(BuildContext context) {
    return _LoopingTypewriter(
      // Cycles through first name then full name for a dramatic effect
      texts: const ["TARUN", "TARUN KRISHNA"],
      charDelayMs: 90,
      deleteDelayMs: 55,
      pauseAfterMs: 1800,
      pauseBeforeMs: 300,
      startDelayMs: 800,
      builder: (context, visible, showCursor) {
        // Split at space to colour each word differently
        final parts = visible.split(" ");
        final firstName = parts[0];
        final lastName = parts.length > 1 ? parts[1] : "";

        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            // TARUN — white gradient
            if (firstName.isNotEmpty)
              Text(
                firstName,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: fontSize,
                      letterSpacing: 3.0,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                      foreground: Paint()..shader = AppColorPalette.white,
                    ),
              ),

            // KRISHNA — purple gradient
            if (lastName.isNotEmpty)
              Text(
                " $lastName",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: fontSize,
                      letterSpacing: 3.0,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                      foreground: Paint()
                        ..shader = AppColorPalette.textGradient,
                    ),
              ),

            // blinking cursor
            Text(
              showCursor ? " |" : "  ",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: fontSize * 0.85,
                    fontWeight: FontWeight.w300,
                    height: 1.1,
                    foreground: Paint()
                      ..shader = AppColorPalette.textGradient,
                  ),
            ),
          ],
        );
      },
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
//  FLOATING PARTICLE BACKGROUND
// ═══════════════════════════════════════════════════════════════════════════════

class _Particle {
  double x, y, vx, vy, radius, opacity;
  _Particle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.radius,
    required this.opacity,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  _ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      canvas.drawCircle(
        Offset(p.x * size.width, p.y * size.height),
        p.radius,
        Paint()
          ..color = const Color(0xFF8728F5).withOpacity(p.opacity)
          ..style = PaintingStyle.fill,
      );
      for (final q in particles) {
        final dx = (p.x - q.x) * size.width;
        final dy = (p.y - q.y) * size.height;
        final dist = math.sqrt(dx * dx + dy * dy);
        if (dist < 120 && dist > 0) {
          canvas.drawLine(
            Offset(p.x * size.width, p.y * size.height),
            Offset(q.x * size.width, q.y * size.height),
            Paint()
              ..color = const Color(0xFF8728F5)
                  .withOpacity(0.06 * (1 - dist / 120))
              ..strokeWidth = 0.6,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter old) => true;
}

class _ParticleBackground extends StatefulWidget {
  const _ParticleBackground();
  @override
  State<_ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<_ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  final _rng = math.Random();
  late List<_Particle> _particles;

  @override
  void initState() {
    super.initState();
    _particles = List.generate(
      38,
      (_) => _Particle(
        x: _rng.nextDouble(),
        y: _rng.nextDouble(),
        vx: (_rng.nextDouble() - 0.5) * 0.00015,
        vy: (_rng.nextDouble() - 0.5) * 0.00015,
        radius: _rng.nextDouble() * 1.8 + 0.6,
        opacity: _rng.nextDouble() * 0.35 + 0.1,
      ),
    );
    _ctrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(_tick)
          ..repeat();
  }

  void _tick() {
    for (final p in _particles) {
      p.x += p.vx;
      p.y += p.vy;
      if (p.x < 0 || p.x > 1) p.vx = -p.vx;
      if (p.y < 0 || p.y > 1) p.vy = -p.vy;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _ParticlePainter(_particles),
        size: Size.infinite,
      );
}

// ═══════════════════════════════════════════════════════════════════════════════
//  NAV ITEM with animated gradient underline
// ═══════════════════════════════════════════════════════════════════════════════

class _NavItem extends StatefulWidget {
  final int index;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const _NavItem({
    required this.index,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });
  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem>
    with SingleTickerProviderStateMixin {
  bool _hovered = false;
  late AnimationController _underlineCtrl;
  late Animation<double> _underlineAnim;

  @override
  void initState() {
    super.initState();
    _underlineCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 280));
    _underlineAnim =
        CurvedAnimation(parent: _underlineCtrl, curve: Curves.easeOut);
  }

  @override
  void didUpdateWidget(_NavItem old) {
    super.didUpdateWidget(old);
    if (widget.isSelected && !old.isSelected) _underlineCtrl.forward();
    else if (!widget.isSelected && old.isSelected) _underlineCtrl.reverse();
  }

  @override
  void dispose() {
    _underlineCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sw = ResponsiveWrapper.of(context).screenWidth;
    final hPad = sw >= 1400 ? 35.0 : sw >= 1024 ? 20.0 : 10.0;
    final activeFontSize = sw < 600 ? 12.0 : sw < 1400 ? 16.0 : 18.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad),
      child: MouseRegion(
        onEnter: (_) => setState(() {
          _hovered = true;
          Variables.hoveredIndex = widget.index;
        }),
        onExit: (_) => setState(() {
          _hovered = false;
          Variables.hoveredIndex = -1;
        }),
        child: GestureDetector(
          onTap: widget.onTap,
          child: CustomAnimation(
            index: widget.index,
            duration: const Duration(milliseconds: 500),
            horizontalOffset: 50.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(
                      0, _hovered && !widget.isSelected ? -5 : 0, 0),
                  child: Text(
                    widget.label,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: widget.isSelected || _hovered
                              ? activeFontSize
                              : 12,
                          foreground: Paint()
                            ..shader = widget.isSelected || _hovered
                                ? AppColorPalette.textGradient
                                : AppColorPalette.white,
                        ),
                  ),
                ),
                const SizedBox(height: 4),
                AnimatedBuilder(
                  animation: _underlineAnim,
                  builder: (_, __) {
                    final w = widget.isSelected
                        ? Measures.getWidth(context) * 0.025 * _underlineAnim.value
                        : _hovered
                            ? Measures.getWidth(context) * 0.015
                            : 0.0;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      height: 2.0,
                      width: w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 95, 36, 153),
                          Color.fromARGB(255, 154, 11, 173),
                        ]),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
//  CONTACT BUTTON with shimmer sweep
// ═══════════════════════════════════════════════════════════════════════════════

class _ContactButton extends StatefulWidget {
  final VoidCallback onTap;
  const _ContactButton({required this.onTap});
  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton>
    with SingleTickerProviderStateMixin {
  bool _hovered = false;
  late AnimationController _shimmerCtrl;
  late Animation<double> _shimmer;

  @override
  void initState() {
    super.initState();
    _shimmerCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _shimmer = Tween<double>(begin: -1.5, end: 2.5)
        .animate(CurvedAnimation(parent: _shimmerCtrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _shimmerCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sw = ResponsiveWrapper.of(context).screenWidth;
    final btnW = sw < 600
        ? Measures.getWidth(context) * 0.13
        : sw >= 1400
            ? Measures.getWidth(context) * 0.05
            : Measures.getWidth(context) * 0.08;

    return MouseRegion(
      onEnter: (_) {
        setState(() => _hovered = true);
        Variables.isHovered = true;
        _shimmerCtrl.forward(from: 0);
      },
      onExit: (_) {
        setState(() => _hovered = false);
        Variables.isHovered = false;
      },
      child: CustomAnimation(
        index: 6,
        duration: const Duration(milliseconds: 1100),
        horizontalOffset: 50.0,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.translationValues(0, _hovered ? -5 : 0, 0),
            height: 38,
            width: btnW,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: _hovered
                    ? Colors.transparent
                    : const Color.fromARGB(255, 135, 24, 245),
              ),
              borderRadius: BorderRadius.circular(10),
              gradient: sw < 1024 || _hovered
                  ? const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 135, 24, 245),
                        Color.fromARGB(255, 154, 11, 173),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: sw >= 1024 && !_hovered ? Colors.transparent : null,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text("Contact",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: sw < 600 ? 12 : 15,
                            color: Colors.white,
                          )),
                  if (_hovered)
                    AnimatedBuilder(
                      animation: _shimmer,
                      builder: (_, __) => Transform.translate(
                        offset: Offset(_shimmer.value * btnW, 0),
                        child: Container(
                          width: btnW * 0.4,
                          height: 38,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.white.withOpacity(0.0),
                              Colors.white.withOpacity(0.18),
                              Colors.white.withOpacity(0.0),
                            ]),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
//  ANIMATED NAV BAR
// ═══════════════════════════════════════════════════════════════════════════════

class _AnimatedNavBar extends StatefulWidget {
  final void Function(int) onNavTap;
  final VoidCallback onContactTap;
  const _AnimatedNavBar({required this.onNavTap, required this.onContactTap});
  @override
  State<_AnimatedNavBar> createState() => _AnimatedNavBarState();
}

class _AnimatedNavBarState extends State<_AnimatedNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeCtrl;
  late List<Animation<double>> _itemFades;

  @override
  void initState() {
    super.initState();
    final itemCount = Variables.indextext.length + 2;
    _fadeCtrl = AnimationController(
        vsync: this, duration: Duration(milliseconds: 200 * itemCount));

    _itemFades = List.generate(itemCount, (i) {
      final start = (i * 0.12).clamp(0.0, 0.88);
      final end = (start + 0.12).clamp(0.0, 1.0);
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _fadeCtrl,
            curve: Interval(start, end, curve: Curves.easeOut)),
      );
    });

    WidgetsBinding.instance
        .addPostFrameCallback((_) => _fadeCtrl.forward());
  }

  @override
  void dispose() {
    _fadeCtrl.dispose();
    super.dispose();
  }

  Widget _faded(int i, Widget child) => AnimatedBuilder(
        animation: _itemFades[i],
        builder: (_, __) => Opacity(
          opacity: _itemFades[i].value,
          child: Transform.translate(
            offset: Offset(0, (1 - _itemFades[i].value) * -12),
            child: child,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final sw = ResponsiveWrapper.of(context).screenWidth;
    final navW = sw >= 1400
        ? Measures.getWidth(context) * 0.32
        : sw >= 1024
            ? Measures.getWidth(context) * 0.38
            : Measures.getWidth(context) * 0.55;

    return SizedBox(
      height: Measures.getHeight(context) * 0.1,
      width: sw < 480
          ? Measures.getWidth(context)
          : Measures.getWidth(context) * 0.95,
      child: Row(
        mainAxisAlignment: sw < 480
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.spaceBetween,
        children: [
          _faded(0, const _TypewriterLogo()),
          SizedBox(
            width: navW,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    Variables.indextext.length,
                    (i) => _faded(
                      i + 1,
                      _NavItem(
                        index: i,
                        label: Variables.indextext[i],
                        isSelected: Variables.selectedindex == i,
                        onTap: () {
                          setState(() => Variables.selectedindex = i);
                          widget.onNavTap(i);
                        },
                      ),
                    ),
                  ),
                ),
                _faded(
                  Variables.indextext.length + 1,
                  _ContactButton(onTap: widget.onContactTap),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
//  HOME PAGE
// ═══════════════════════════════════════════════════════════════════════════════

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _handleNavTap(int index) {
    setState(() {});
    final label = Variables.indextext[index];
    GlobalKey? target;
    if (label == "Projects") target = Variables.abt4key;
    else if (label == "Home") target = Variables.key1;
    else if (label == "Certificates") target = Variables.certificatekey;
    if (target?.currentContext != null) {
      Scrollable.ensureVisible(target!.currentContext!,
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  void _handleContactTap() {
    if (Variables.headerKey.currentContext != null) {
      Scrollable.ensureVisible(Variables.headerKey.currentContext!,
          alignment: 0.0,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Measures.getWidth(context),
          child: Stack(children: [
            // Lottie background
            SizedBox(
              height: Measures.getHeight(context) * 0.2,
              width: Measures.getWidth(context),
              child:
                  Lottie.asset(CustomIcons.bganimation, fit: BoxFit.fitHeight),
            ),

            // Blur overlay
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
              child: SizedBox(
                width: Measures.getWidth(context),
                child: Stack(children: [
                  Container(
                    width: Measures.getWidth(context),
                    color: Colors.black.withOpacity(0.65),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: ResponsiveWrapper.of(context).screenWidth < 480
                          ? Measures.getWidth(context)
                          : Measures.getWidth(context) * 0.85,
                      child: Column(
                        children: [
                          _AnimatedNavBar(
                            onNavTap: _handleNavTap,
                            onContactTap: _handleContactTap,
                          ),
                          const SizedBox(height: 20.0),
                          const Expanded(child: HomeContent()),
                          const SizedBox(height: 50.0),
                        ],
                      ),
                    ),
                  ),

                  // Particles
                  const Positioned.fill(
                    child: IgnorePointer(
                      child: Opacity(
                        opacity: 0.55,
                        child: _ParticleBackground(),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
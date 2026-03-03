// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/App/Function/emailsend.dart';
import 'package:myportfolio/App/Utils/Variables.dart';
import 'package:myportfolio/Views/Animations/animation.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';

// ─────────────────────────────────────────────────────────────────
// Shared contact form logic in one place
// ─────────────────────────────────────────────────────────────────
class _ContactFormState extends State<_ContactForm> {
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  bool _sent = false;
  bool _loading = false;

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _emailCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final name = '${_firstNameCtrl.text.trim()} ${_lastNameCtrl.text.trim()}';
    if (name.trim().isEmpty ||
        _emailCtrl.text.trim().isEmpty ||
        _descCtrl.text.trim().isEmpty) {
      return;
    }
    setState(() => _loading = true);
    try {
      final ok = await emailservice.sendemail(
          name: name,
          email: _emailCtrl.text.trim(),
          message: _descCtrl.text.trim());
      if (mounted) setState(() { _sent = ok; _loading = false; });
      if (ok) {
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) setState(() => _sent = false);
        });
      }
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final bool isMobile = sw < 600;
    final double labelFs = isMobile ? 13 : 15;

    InputDecoration field(String label, String hint, IconData icon) =>
        InputDecoration(
          prefixIcon: Icon(icon, color: AppColorPalette.secendarycolor, size: 20),
          labelText: label,
          labelStyle: GoogleFonts.lato(
              fontSize: labelFs,
              fontWeight: FontWeight.w500,
              color: AppColorPalette.secendarycolor),
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColorPalette.secendarycolor.withOpacity(0.5)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: AppColorPalette.secendarycolor, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: AppColorPalette.secendarycolor.withOpacity(0.4),
                  width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 135, 24, 245), width: 2)),
        );

    final textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: isMobile ? 13 : 15, color: Colors.white.withOpacity(0.85));

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 135, 24, 245).withOpacity(0.07),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: const Color.fromARGB(255, 135, 24, 245).withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Get in Touch",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: isMobile ? 22 : 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text("You can reach me anytime",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 13, color: Colors.white54)),
          const SizedBox(height: 20),

          // First + Last name row
          Row(children: [
            Expanded(
              child: TextFormField(
                  controller: _firstNameCtrl,
                  style: textStyle,
                  decoration: field("First Name", "Tarun", Icons.person)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                  controller: _lastNameCtrl,
                  style: textStyle,
                  decoration: field("Last Name", "Krishna", Icons.person)),
            ),
          ]),
          const SizedBox(height: 14),

          // Email
          TextFormField(
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              style: textStyle,
              decoration:
                  field("Email", "tarunkrish2001@gmail.com", Icons.email)),
          const SizedBox(height: 14),

          // Message
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(0.04),
              border: Border.all(
                  color: AppColorPalette.secendarycolor.withOpacity(0.4)),
            ),
            child: TextFormField(
              controller: _descCtrl,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              style: textStyle,
              decoration: InputDecoration(
                hintText: "Your message…",
                hintStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    color: AppColorPalette.secendarycolor.withOpacity(0.5)),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(14),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Submit
          GestureDetector(
            onTap: _loading ? null : _send,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 135, 24, 245),
                    Color.fromARGB(255, 154, 11, 173),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: _loading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2))
                  : Text("Send Message",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
            ),
          ),

          if (_sent) ...[
            const SizedBox(height: 14),
            Row(children: [
              const Icon(Icons.check_circle, color: Colors.greenAccent, size: 18),
              const SizedBox(width: 8),
              Text("Sent successfully!",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, color: Colors.greenAccent)),
            ]),
          ],
        ],
      ),
    );
  }
}

class _ContactForm extends StatefulWidget {
  const _ContactForm();
  @override
  State<_ContactForm> createState() => _ContactFormState();
}

// ─────────────────────────────────────────────────────────────────
// Contact info panel
// ─────────────────────────────────────────────────────────────────
class _ContactInfo extends StatelessWidget {
  const _ContactInfo();

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final bool isMobile = sw < 600;
    final double titleFs = isMobile ? 28 : 40;
    final double bodyFs = isMobile ? 14 : 16;

    return CustomAnimation(
      index: 12,
      duration: const Duration(milliseconds: 800),
      verticalOffset: 40.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Contact",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: titleFs,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.9))),
          const SizedBox(height: 6),
          Text("Let's Connect and Collaborate",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: bodyFs - 1,
                  color: Colors.white60,
                  fontWeight: FontWeight.w500)),
          const SizedBox(height: 14),
          Text(
            "Have a project in mind or want to discuss cloud automation? Feel free to reach out.",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: bodyFs - 1, color: Colors.white54, height: 1.6),
          ),
          const SizedBox(height: 20),
          _InfoRow(icon: Icons.email_outlined,
              text: "tarunkrish2001@gmail.com",
              fontSize: bodyFs - 1),
          const SizedBox(height: 10),
          _InfoRow(icon: Icons.phone_outlined,
              text: "+91 9597176872",
              fontSize: bodyFs - 1),
          const SizedBox(height: 10),
          _InfoRow(icon: Icons.location_on_outlined,
              text: "India",
              fontSize: bodyFs - 1),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final double fontSize;
  const _InfoRow(
      {required this.icon, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color.fromARGB(255, 135, 24, 245), size: 18),
        const SizedBox(width: 10),
        Flexible(
          child: Text(text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: fontSize,
                  color: Colors.white.withOpacity(0.75))),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────
// DESKTOP Contact (side-by-side)
// ─────────────────────────────────────────────────────────────────
class Contactus extends StatelessWidget {
  const Contactus({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: Variables.headerKey,
      width: double.infinity,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 4, child: _ContactInfo()),
          SizedBox(width: 40),
          Expanded(flex: 5, child: _ContactForm()),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────
// MOBILE Contact (stacked)
// ─────────────────────────────────────────────────────────────────
class MobileViewContactus extends StatelessWidget {
  const MobileViewContactus({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: Variables.headerKey,
      width: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ContactInfo(),
          SizedBox(height: 28),
          _ContactForm(),
        ],
      ),
    );
  }
}

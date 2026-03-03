// ignore_for_file: deprecated_member_use
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:download/download.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:myportfolio/App/Screens/Aboutme/aboutme.dart';
import 'package:myportfolio/App/Screens/Certification/certificates.dart';
import 'package:myportfolio/App/Screens/ContactUs/contactus.dart';
import 'package:myportfolio/App/Screens/Projects/projects.dart';
import 'package:myportfolio/App/Screens/TechStack/teckstack.dart';
import 'package:myportfolio/App/Utils/Variables.dart';
import 'package:myportfolio/Views/Animations/animation.dart';
import 'package:myportfolio/Views/Themes/Colors/colors.dart';
import 'package:myportfolio/Views/Themes/Icons/icons.dart';
import 'package:myportfolio/Views/Themes/Measures/measures.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  void _onAbtHover(bool v) => setState(() => Variables.abtmeisHovered = v);
  void _onDownHover(bool v) => setState(() => Variables.resumedownHovered = v);

  Future<void> _downloadResume() async {
    final bytes = await rootBundle.load('Assets/Images/DevopsResume.pdf');
    final stream = Stream.fromIterable(bytes.buffer.asUint8List());
    download(stream, 'TarunKrishna_Resume.pdf');
  }

  @override
  void initState() {
    super.initState();
    Variables.scrollControllers.addListener(() {
      if (mounted) setState(() => Variables.scrollPosition = Variables.scrollControllers.position.pixels);
    });
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final bool isMobile = sw < 600;

    return SizedBox(
      height: Measures.getHeight(context) * 0.85,
      width: Measures.getWidth(context) * 0.85,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          controller: Variables.scrollControllers,
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // ── Hero ─────────────────────────────────────────────────
              Measures.islargerScreen(context)
                  ? _HeroDesktop(onAbtHover: _onAbtHover, onDownHover: _onDownHover, downloadResume: _downloadResume)
                  : _HeroMobile(onAbtHover: _onAbtHover, onDownHover: _onDownHover, downloadResume: _downloadResume),

              const SizedBox(height: 70),

              // ── 01. About Me ─────────────────────────────────────────
              AboutMe(
                txtno: "01.", keys: Variables.abt1key, title: "About Me",
                descrption:
                    "I'm Tarun Krishna, a certified Azure DevOps Engineer (AZ-400) with 3+ years of experience building and operating enterprise-grade CI/CD automation, cloud infrastructure and DevSecOps pipelines on Microsoft Azure.\n\nMy primary expertise is Azure DevOps — designing multi-stage YAML pipelines, release gates, artifact management and environment-based approvals that connect code commits to production deployments safely and repeatably. I work hands-on with Azure Repos, Azure Pipelines, Azure Artifacts and Azure Test Plans daily across multi-team SaaS product environments.\n\nBeyond pipelines, I provision and manage the full Azure infrastructure stack using Terraform, Bicep and ARM Templates — from AKS clusters and App Services to VNets, Key Vault and Azure SQL. I've reduced deployment lead times by 60%+, led three cloud migration projects to Azure, and built observability stacks with Azure Monitor, Prometheus and Grafana that cut MTTR by 40%.\n\nI hold AZ-400 (DevOps Engineer Expert) and AZ-204 (Azure Developer Associate) certifications from Microsoft.",
                descrption2: "", descrption3: "", descrption4: "Core DevOps Technologies I Work With",
                isprofile: false, duration: const Duration(milliseconds: 400), index: 1,
                isVisible: Measures.isInView(Variables.abt1key, context),
              ),
              const SizedBox(height: 70),

              // ── 02. Where I've Worked (combined) ────────────────────
              _WorkExperience(
                keys: Variables.abt2key,
                isVisible: Measures.isInView(Variables.abt2key, context),
              ),
              const SizedBox(height: 80),

              // ── 03. Projects ─────────────────────────────────────────
              isMobile
                  ? MobileViewProjects(
                      textno: "03.", keys: Variables.abt3key,
                      duration: const Duration(milliseconds: 700),
                      texttitle: "Featured Project",
                      ischangePosition: false,
                      textsubtitle: "Enterprise CI/CD & Azure DevOps Automation",
                      textdesc:
                          "Architected and delivered end-to-end multi-stage CI/CD pipelines on Azure DevOps for a multi-tenant SaaS platform serving 50+ enterprise clients. Built YAML-based pipelines covering build, unit test, SAST security scan, Docker image push, Helm chart validation and phased environment deployments (Dev → QA → Staging → Production) with automated approval gates.\n\nAutomated all cloud infrastructure provisioning using Bicep and Terraform — eliminating manual deployments and reducing environment spin-up time by 70%. Integrated Azure Key Vault for secrets injection, enforced RBAC policies across subscriptions and achieved full audit compliance.",
                      textend: "Azure DevOps  |  GitHub Actions  |  Terraform  |  Bicep  |  Docker  |  AKS  |  Key Vault",
                      title: "Projects I've Delivered", index: 3,
                      isVisible: Measures.isInView(Variables.abt3key, context))
                  : projects(
                      textno: "03.", keys: Variables.abt3key,
                      duration: const Duration(milliseconds: 700),
                      texttitle: "Featured Project",
                      ischangePosition: false,
                      textsubtitle: "Enterprise CI/CD & Azure DevOps Automation",
                      textdesc:
                          "Architected end-to-end multi-stage CI/CD pipelines on Azure DevOps for a multi-tenant SaaS platform. Built YAML pipelines covering build, test, SAST scan, Docker image push, Helm validation and phased environment deployments (Dev → QA → Staging → Prod) with automated approval gates. Integrated Azure Key Vault for secrets injection, enforced RBAC policies and achieved full audit compliance. Reduced environment spin-up time by 70% using Bicep and Terraform IaC.",
                      textend: "Azure DevOps  |  GitHub Actions  |  Terraform  |  Bicep  |  Docker  |  AKS  |  Key Vault",
                      title: "Projects I've Delivered", index: 3,
                      isVisible: Measures.isInView(Variables.abt3key, context)),

              isMobile
                  ? MobileViewProjects(
                      ischangePosition: true, keys: Variables.abt4key,
                      duration: const Duration(milliseconds: 800),
                      texttitle: "Featured Project",
                      textsubtitle: "Kubernetes (AKS) Microservices Platform",
                      textdesc:
                          "Designed and deployed a production-grade Kubernetes (AKS) cluster hosting 12 microservices with auto-scaling (HPA/VPA), pod disruption budgets and zero-downtime rolling deployments. Managed Helm chart releases with versioned rollback capability. Implemented a full observability stack — Prometheus scraping, custom Grafana dashboards and PagerDuty alerting — reducing MTTR by 40%. Configured Azure CNI networking, ingress controllers and TLS certificate automation.",
                      textend: "Kubernetes (AKS)  |  Helm  |  Prometheus  |  Grafana  |  Azure CNI  |  Azure Monitor",
                      index: 4, isVisible: Measures.isInView(Variables.abt4key, context))
                  : projects(
                      ischangePosition: true, keys: Variables.abt4key,
                      duration: const Duration(milliseconds: 800),
                      texttitle: "Featured Project",
                      textsubtitle: "Kubernetes (AKS) Microservices Platform",
                      textdesc:
                          "Designed and deployed a production-grade AKS cluster hosting 12 microservices with auto-scaling (HPA/VPA) and zero-downtime rolling deployments. Managed Helm chart releases with versioned rollback. Implemented full observability — Prometheus, custom Grafana dashboards and PagerDuty alerting — reducing MTTR by 40%. Configured Azure CNI networking, ingress controllers and TLS certificate automation.",
                      textend: "Kubernetes (AKS)  |  Helm  |  Prometheus  |  Grafana  |  Azure CNI  |  Azure Monitor",
                      index: 4, isVisible: Measures.isInView(Variables.abt4key, context)),

              const SizedBox(height: 30),

              // ── 04. Certifications ────────────────────────────────────
              isMobile
                  ? MobileViewCertificate(
                      textno: "04.", keys: Variables.certificatekey,
                      duration: const Duration(milliseconds: 500),
                      texttitle: "Certification", ischangePosition: false,
                      textsubtitle: "AZ-204: Developing Solutions for Microsoft Azure",
                      textdesc: "Validates expertise in developing cloud-native solutions on Azure — including Azure Functions, Cosmos DB, Blob Storage, API Management and Azure AD authentication flows.",
                      textend: "Microsoft Azure  |  Cloud Development  |  Serverless  |  DevOps",
                      title: "Certifications Earned", index: 5,
                      isVisible: Measures.isInView(Variables.certificatekey, context))
                  : Certification(
                      textno: "04.", keys: Variables.certificatekey,
                      duration: const Duration(milliseconds: 500),
                      texttitle: "Certification", ischangePosition: false,
                      textsubtitle: "AZ-204: Developing Solutions for Microsoft Azure",
                      textdesc: "Validates expertise in developing cloud-native solutions on Azure — including Azure Functions, Cosmos DB, Blob Storage, API Management and Azure AD authentication flows.",
                      textend: "Microsoft Azure  |  Cloud Development  |  Serverless  |  DevOps",
                      title: "Certifications Earned", index: 5,
                      isVisible: Measures.isInView(Variables.certificatekey, context)),

              isMobile
                  ? MobileViewCertificate(
                      ischangePosition: true, keys: Variables.certificatekey2,
                      duration: const Duration(milliseconds: 500),
                      texttitle: "Certification",
                      textsubtitle: "AZ-400: Designing and Implementing DevOps Solutions",
                      textdesc: "Microsoft's highest-level DevOps certification — demonstrates mastery in CI/CD pipeline design, infrastructure automation, dependency management, continuous feedback and DevSecOps practices at enterprise scale.",
                      textend: "Azure DevOps  |  CI/CD  |  IaC  |  DevSecOps  |  Automation",
                      index: 6, isVisible: Measures.isInView(Variables.certificatekey2, context))
                  : Certification(
                      ischangePosition: true, keys: Variables.certificatekey2,
                      duration: const Duration(milliseconds: 500),
                      texttitle: "Certification",
                      textsubtitle: "AZ-400: Designing and Implementing DevOps Solutions",
                      textdesc: "Microsoft's highest-level DevOps certification — demonstrates mastery in CI/CD pipeline design, infrastructure automation, dependency management, continuous feedback and DevSecOps practices at enterprise scale.",
                      textend: "Azure DevOps  |  CI/CD  |  IaC  |  DevSecOps  |  Automation",
                      index: 6, isVisible: Measures.isInView(Variables.certificatekey2, context)),

              const SizedBox(height: 40),

              // ── 05. Tech Stack ────────────────────────────────────────
              TechStackSection(
                techkeys: Variables.techstackkey, index: 7,
                duration: const Duration(milliseconds: 500),
                isVisible: Measures.isInView(Variables.techstackkey, context),
              ),
              const SizedBox(height: 60),

              // ── Contact ───────────────────────────────────────────────
              isMobile ? const MobileViewContactus() : const Contactus(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// WORK EXPERIENCE  —  single section with timeline cards
// ══════════════════════════════════════════════════════════════════════
class _WorkExperience extends StatelessWidget {
  final Key? keys;
  final double? isVisible;
  const _WorkExperience({this.keys, this.isVisible});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final double vis = isVisible ?? 0.0;

    return AnimatedOpacity(
      opacity: vis,
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        key: keys,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section header
            if (vis != 0.0)
              CustomAnimation(
                index: 2, duration: const Duration(milliseconds: 500),
                horizontalOffset: 40.0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Row(children: [
                    Text("02.",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 19,
                            foreground: Paint()..shader = AppColorPalette.textGradient)),
                    const SizedBox(width: 20),
                    Flexible(
                      child: Text("Where I've Worked",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 22,
                              foreground: Paint()..shader = AppColorPalette.white)),
                    ),
                    const SizedBox(width: 20),
                    const Expanded(child: Divider(height: 0.3, color: Colors.white60)),
                  ]),
                ),
              ),

            // Experience cards
            if (vis != 0.0) ...[
              CustomAnimation(
                index: 3, duration: const Duration(milliseconds: 600),
                horizontalOffset: 40.0,
                child: _ExperienceCard(
                  role: "Azure DevOps Engineer",
                  company: "Tamuinfotech Pvt. Ltd.",
                  period: "January 2023 – Present",
                  points: const [
                    "Designed and maintained multi-stage CI/CD pipelines on Azure DevOps and GitHub Actions for 5+ product teams, reducing release cycle time by over 60%.",
                    "Provisioned and managed Azure infrastructure (AKS, App Service, Azure SQL, Storage Accounts, VNets) using Bicep and Terraform IaC templates with GitOps-based promotion workflows.",
                    "Deployed and operated Kubernetes (AKS) clusters hosting microservices workloads — configuring HPA, pod disruption budgets, rolling updates and Helm-based release management.",
                    "Implemented DevSecOps practices: integrated SAST/DAST scanning in pipelines, managed secrets via Azure Key Vault, enforced RBAC policies across Azure subscriptions.",
                    "Built full observability stack with Azure Monitor, Log Analytics, Application Insights, Prometheus and Grafana — reducing MTTR by 40% through proactive alerting.",
                    "Led cloud migration of 3 legacy on-premise applications to Azure, achieving 99.9% uptime SLA post-migration.",
                  ],
                  sw: sw,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final String role;
  final String company;
  final String period;
  final List<String> points;
  final double sw;

  const _ExperienceCard({
    required this.role,
    required this.company,
    required this.period,
    required this.points,
    required this.sw,
  });

  @override
  Widget build(BuildContext context) {
    final double bodyFs = sw < 480 ? 13 : sw < 768 ? 14 : 15;
    final double maxW = sw < 600 ? double.infinity : sw * 0.65;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxW),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color.fromARGB(255, 135, 24, 245).withOpacity(0.06),
          border: Border.all(
            color: const Color.fromARGB(255, 135, 24, 245).withOpacity(0.25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Role + company + period
            Text(role,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: sw < 480 ? 16 : 18,
                    foreground: Paint()..shader = AppColorPalette.textGradient,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(company,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: bodyFs, color: Colors.white70,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 2),
            Text(period,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: bodyFs - 1, color: Colors.white38)),
            const SizedBox(height: 18),
            // Bullet points
            ...points.map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6, right: 10),
                    child: Container(
                      width: 5, height: 5,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 135, 24, 245),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(p,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: bodyFs, color: Colors.white60, height: 1.6)),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// HERO – DESKTOP
// ══════════════════════════════════════════════════════════════════════
class _HeroDesktop extends StatelessWidget {
  final void Function(bool) onAbtHover;
  final void Function(bool) onDownHover;
  final Future<void> Function() downloadResume;
  const _HeroDesktop({required this.onAbtHover, required this.onDownHover, required this.downloadResume});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 6, child: _HeroText(onAbtHover: onAbtHover, onDownHover: onDownHover, downloadResume: downloadResume)),
        const SizedBox(width: 40),
        const Expanded(flex: 4, child: _HeroProfileImage()),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// HERO – MOBILE
// ══════════════════════════════════════════════════════════════════════
class _HeroMobile extends StatelessWidget {
  final void Function(bool) onAbtHover;
  final void Function(bool) onDownHover;
  final Future<void> Function() downloadResume;
  const _HeroMobile({required this.onAbtHover, required this.onDownHover, required this.downloadResume});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _HeroProfileImage(compact: true),
        const SizedBox(height: 24),
        _HeroText(onAbtHover: onAbtHover, onDownHover: onDownHover, downloadResume: downloadResume),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// HERO TEXT
// ══════════════════════════════════════════════════════════════════════
class _HeroText extends StatelessWidget {
  final void Function(bool) onAbtHover;
  final void Function(bool) onDownHover;
  final Future<void> Function() downloadResume;
  const _HeroText({required this.onAbtHover, required this.onDownHover, required this.downloadResume});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final double nameFontSize = sw < 480 ? 36 : sw < 768 ? 48 : 62;
    final double titleFontSize = sw < 480 ? 18 : sw < 768 ? 24 : 34;
    final double descFontSize = sw < 480 ? 13 : sw < 768 ? 14 : 15;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAnimation(index: 1, duration: const Duration(milliseconds: 500), horizontalOffset: 40.0,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Text("Hey I'm", style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: sw < 480 ? 16 : 20, color: Colors.white70, fontWeight: FontWeight.w400)),
            const SizedBox(width: 10),
            SizedBox(height: 28, child: Lottie.asset("Assets/Animation/Wave.json")),
          ]),
        ),
        const SizedBox(height: 6),
        CustomAnimation(index: 2, duration: const Duration(milliseconds: 700), horizontalOffset: 40.0,
          child: AnimatedTextKit(
            animatedTexts: [TypewriterAnimatedText('Tarun Krishna', cursor: '',
              textStyle: TextStyle(foreground: Paint()..shader = AppColorPalette.textGradient,
                  fontSize: nameFontSize, fontWeight: FontWeight.bold),
              speed: const Duration(milliseconds: 70))],
            totalRepeatCount: 1, displayFullTextOnTap: true,
          ),
        ),
        const SizedBox(height: 6),
        CustomAnimation(index: 3, duration: const Duration(milliseconds: 800), horizontalOffset: 40.0,
          child: Text("Azure DevOps Engineer",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: titleFontSize, color: Colors.white, fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 12),
        CustomAnimation(index: 4, duration: const Duration(milliseconds: 900), horizontalOffset: 40.0,
          child: Text("3+ years building enterprise CI/CD pipelines, Kubernetes clusters and cloud infrastructure on Microsoft Azure. AZ-400 & AZ-204 certified.",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: descFontSize, color: Colors.white54, height: 1.65)),
        ),
        const SizedBox(height: 26),
        CustomAnimation(index: 5, duration: const Duration(milliseconds: 1000), horizontalOffset: 40.0,
          child: Wrap(spacing: 14, runSpacing: 12, children: [
            _HeroButton(label: "About me", isHovered: Variables.abtmeisHovered,
                onHover: onAbtHover, keyRef: Variables.key1,
                onTap: () => Scrollable.ensureVisible(Variables.key1.currentContext!,
                    duration: const Duration(milliseconds: 800), curve: Curves.easeInOut)),
            _HeroButton(label: "Download Resume", isHovered: Variables.resumedownHovered,
                onHover: onDownHover, onTap: downloadResume),
          ]),
        ),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// HERO BUTTON
// ══════════════════════════════════════════════════════════════════════
class _HeroButton extends StatelessWidget {
  final String label;
  final bool isHovered;
  final void Function(bool) onHover;
  final VoidCallback onTap;
  final GlobalKey? keyRef;
  const _HeroButton({required this.label, required this.isHovered, required this.onHover, required this.onTap, this.keyRef});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          key: keyRef,
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, isHovered ? -4 : 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 11),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: isHovered ? Colors.transparent : const Color.fromARGB(255, 135, 24, 245)),
            gradient: isHovered ? const LinearGradient(
              colors: [Color.fromARGB(255, 135, 24, 245), Color.fromARGB(255, 154, 11, 173)],
              begin: Alignment.topLeft, end: Alignment.bottomRight) : null,
          ),
          child: Text(label, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// HERO PROFILE IMAGE  — subtle float animation
// ══════════════════════════════════════════════════════════════════════
class _HeroProfileImage extends StatefulWidget {
  final bool compact;
  const _HeroProfileImage({this.compact = false});
  @override
  State<_HeroProfileImage> createState() => _HeroProfileImageState();
}

class _HeroProfileImageState extends State<_HeroProfileImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _float;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat(reverse: true);
    _float = Tween<double>(begin: 0, end: -10).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final double size = widget.compact ? 150 : 260;
    return CustomAnimation(
      index: 9, duration: const Duration(milliseconds: 900), verticalOffset: 30.0,
      child: Center(
        child: AnimatedBuilder(
          animation: _float,
          builder: (_, child) => Transform.translate(offset: Offset(0, _float.value), child: child),
          child: Container(
            width: size, height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              boxShadow: [BoxShadow(
                color: const Color.fromARGB(255, 135, 24, 245).withOpacity(0.28),
                blurRadius: 28, spreadRadius: 3)],
              border: Border.all(
                color: const Color.fromARGB(255, 135, 24, 245).withOpacity(0.55), width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(CustomIcons.profile, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}

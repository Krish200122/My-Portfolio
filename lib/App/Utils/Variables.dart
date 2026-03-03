import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Variables {
  static final List<String> indextext = [
    "Home",
    "Projects",
    "Certificates",
  ];
  static int selectedindex = 0;

  static bool isHovered = false;
  static bool iscontactHovered = false;
  static bool abtmeisHovered = false;
  static bool resumedownHovered = false;
  static bool resumesubmenu = false;
  static bool isprofile = false;
  static bool isprojects1 = false;
  static bool isprojects2 = false;
  static bool iscertificate1 = false;
  static bool iscertificate2 = false;
  static bool isemailprocess = false;
  static int hoveredIndex = -1;
  static final ScrollController scrollController = ScrollController();
  static final ScrollController scrollControllers = ScrollController();
  static double scrollPosition = 0.0;
  static var headerKey = GlobalKey();
  static var key1 = GlobalKey();
  static var key2 = GlobalKey();
  static var key3 = GlobalKey();
  static var key4 = GlobalKey();
  static var abt1key = GlobalKey();
  static var abt2key = GlobalKey();
  static var experkey = GlobalKey();
  static var abt3key = GlobalKey();
  static var abt4key = GlobalKey();
  static var certificatekey = GlobalKey();
  static var certificatekey2 = GlobalKey();
  static var techstackkey = GlobalKey();
  static var abt5key = GlobalKey();
  static var contactuskey = GlobalKey();

  static final List<Map<String, dynamic>> techStack = [
    {
      "name": "Azure DevOps",
      "icon": FontAwesomeIcons.cloud,
      "desc":
          "Multi-stage YAML pipelines for CI/CD automation across enterprise environments."
    },
    {
      "name": "GitHub Actions",
      "icon": FontAwesomeIcons.gears,
      "desc":
          "Automated workflows for build, test, security scan and deployment."
    },
    {
      "name": "Docker",
      "icon": FontAwesomeIcons.docker,
      "desc":
          "Containerization of microservices for consistent deployments across environments."
    },
    {
      "name": "Kubernetes (AKS)",
      "icon": FontAwesomeIcons.server,
      "desc":
          "Orchestrating containerized workloads with auto-scaling and high availability on AKS."
    },
    {
      "name": "Terraform",
      "icon": FontAwesomeIcons.layerGroup,
      "desc":
          "Infrastructure as Code for automated cloud provisioning and environment management."
    },
    {
      "name": "Bicep / ARM",
      "icon": FontAwesomeIcons.fileCode,
      "desc":
          "Azure-native IaC templates for declarative resource deployment."
    },
    {
      "name": "Prometheus & Grafana",
      "icon": FontAwesomeIcons.chartLine,
      "desc":
          "End-to-end observability with metrics collection, alerting and dashboards."
    },
    {
      "name": "Azure Key Vault",
      "icon": FontAwesomeIcons.key,
      "desc":
          "Secure secrets management and RBAC for DevSecOps pipelines."
    },
    {
      "name": "Bash / PowerShell",
      "icon": FontAwesomeIcons.terminal,
      "desc":
          "Scripting and automation for deployment pipelines, infra tasks and incident response."
    },
    {
      "name": "Helm",
      "icon": FontAwesomeIcons.anchor,
      "desc":
          "Kubernetes package manager for versioned application releases and rollback management."
    },
    {
      "name": "Azure Monitor",
      "icon": FontAwesomeIcons.bell,
      "desc":
          "Full-stack cloud monitoring with Log Analytics, Application Insights and alert rules."
    },
    {
      "name": "Git / GitHub",
      "icon": FontAwesomeIcons.codeBranch,
      "desc":
          "Version control and GitOps workflows powering all infrastructure and application code."
    },
    {
      "name": "Azure App Service",
      "icon": FontAwesomeIcons.cloudArrowUp,
      "desc":
          "PaaS hosting for web APIs and microservices with deployment slots and auto-scaling."
    },
    {
      "name": "YAML Pipelines",
      "icon": FontAwesomeIcons.fileLines,
      "desc":
          "Declarative multi-stage pipeline definitions for repeatable, auditable CI/CD flows."
    },
  ];
}

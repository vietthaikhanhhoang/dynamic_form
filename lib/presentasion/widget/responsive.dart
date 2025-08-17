import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
    this.mediumDesktop,
    this.largeDesktop,
  });

  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? mediumDesktop;
  final Widget? largeDesktop;

  static int maxWidthMediumDesk = 1199;
  static int maxWidthDesk = 991;
  static int maxWidthTable = 767;
  static int maxWidthMobile = 575;

  // Get Bool function
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= maxWidthMobile;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width <= maxWidthTable &&
      MediaQuery.of(context).size.width >= maxWidthMobile;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= maxWidthTable;

  // Show Widget only
  static Widget onlyDesktop(BuildContext context, Widget widget) {
    if (Responsive.isDesktop(context)) {
      return widget;
    } else {
      return const SizedBox.shrink();
    }
  }

  static Widget onlyTablet(BuildContext context, Widget widget) {
    if (Responsive.isTablet(context)) {
      return widget;
    } else {
      return const SizedBox.shrink();
    }
  }

  static Widget onlyMobile({
    required BuildContext context,
    required Widget widget,
  }) {
    if (Responsive.isMobile(context)) {
      return widget;
    } else {
      return const SizedBox.shrink();
    }
  }

  // Responsive double
  static double getDouble(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
    double? mediumDesktop,
    double? largeDesktop,
  }) {
    final Size size = MediaQuery.of(context).size;

    if (largeDesktop != null && size.width >= maxWidthMediumDesk) {
      return largeDesktop;
    } else if (mediumDesktop != null && size.width >= maxWidthDesk) {
      return mediumDesktop;
    } else if (desktop != null && size.width >= maxWidthTable) {
      return desktop;
    } else if (tablet != null && size.width >= maxWidthMobile) {
      return tablet;
    }

    return mobile;
  }

  static int getInt(
    BuildContext context, {
    required int mobile,
    int? tablet,
    int? desktop,
    int? mediumDesktop,
    int? largeDesktop,
  }) {
    final Size size = MediaQuery.of(context).size;

    if (largeDesktop != null && size.width >= maxWidthMediumDesk) {
      return largeDesktop;
    } else if (mediumDesktop != null && size.width >= maxWidthDesk) {
      return mediumDesktop;
    } else if (desktop != null && size.width >= maxWidthTable) {
      return desktop;
    } else if (tablet != null && size.width >= maxWidthMobile) {
      return tablet;
    }

    return mobile;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (largeDesktop != null && size.width >= maxWidthMediumDesk) {
      return largeDesktop!;
    } else if (mediumDesktop != null && size.width >= maxWidthDesk) {
      return mediumDesktop!;
    } else if (desktop != null && size.width >= maxWidthTable) {
      return desktop!;
    } else if (tablet != null && size.width >= maxWidthMobile) {
      return tablet!;
    } else {
      return mobile ?? const SizedBox.shrink();
    }
  }
}

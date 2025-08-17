part of 'indext.dart';

double getAppbarHeight({required BuildContext context}) {
  double appBarHeight = AppBar().preferredSize.height;
  double statusBarHeight = MediaQuery.of(context).padding.top;

  return appBarHeight + statusBarHeight;
}

double getFontSize({
  required BuildContext context,
  TextSize size = TextSize.normal,
}) {
  late double fontOut;

  double ratio = 1.15;
  double fontSize = Responsive.getDouble(context, mobile: 14, tablet: 18);
  double sizeSmall = Responsive.getDouble(context, mobile: 13, tablet: 16);
  double sizeSmallA = Responsive.getDouble(context, mobile: 11, tablet: 14);

  double size_2 = fontSize * ratio;
  double size_3 = size_2 * ratio;
  double size_4 = size_3 * ratio;
  double size_5 = size_4 * ratio;
  double size_6 = size_5 * ratio;
  double size_7 = size_6 * ratio;
  double size_8 = size_7 * ratio;

  switch (size) {
    case TextSize.small:
      fontOut = sizeSmall;
      break;
    case TextSize.small_1:
      fontOut = sizeSmallA;
      break;
    case TextSize.size_2:
      fontOut = size_2;
      break;
    case TextSize.size_3:
      fontOut = size_3;
      break;
    case TextSize.size_4:
      fontOut = size_4;
      break;
    case TextSize.size_5:
      fontOut = size_5;
      break;
    case TextSize.size_6:
      fontOut = size_6;
      break;
    case TextSize.size_7:
      fontOut = size_7;
      break;
    case TextSize.size_8:
      fontOut = size_8;
      break;
    default:
      fontOut = fontSize;
      break;
  }

  return fontOut;
}

double getRadius({
  required BuildContext context,
  RadiusEnum size = RadiusEnum.md,
}) {
  switch (size) {
    case RadiusEnum.xxl:
      return 30;
    case RadiusEnum.xl:
      return 24;
    case RadiusEnum.lg:
      return 12;
    case RadiusEnum.sm:
      return 4;
    default:
      return 8;
  }
}

Size getButtonSize({
  required BuildContext context,
  ButtonSize size = ButtonSize.md,
}) {
  switch (size) {
    case ButtonSize.lg:
      return Size(
        double.infinity,
        Responsive.getDouble(context, mobile: 48, tablet: 48),
      );
    case ButtonSize.sm:
      return Size(
        double.infinity,
        Responsive.getDouble(context, mobile: 40, tablet: 40),
      );
    default:
      return Size(
        double.infinity,
        Responsive.getDouble(context, mobile: 44, tablet: 44),
      );
  }
}

Gradient getGradien({
  required BuildContext context,
  BgGradient style = BgGradient.linearPrimaryLightTopBottom,
}) {
  switch (style) {
    default:
      return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Theme.of(context).colorScheme.surfaceBright,
          Theme.of(context).colorScheme.surface,
        ],
      );
  }
}

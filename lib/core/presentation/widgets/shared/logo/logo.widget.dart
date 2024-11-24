import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum LogoContext { COLORED, ICON, SHORT, LONG }

class Logo extends StatelessWidget {
  final LogoContext logoContext;
  final bool isDarkTheme;
  final double? width;
  final double? height;

  const Logo({
    super.key,
    required this.logoContext,
    required this.isDarkTheme,
    this.width,
    this.height,
  });

  String _getSvgAssetPath() {
    final theme = isDarkTheme ? 'dark' : 'light';
    switch (logoContext) {
      case LogoContext.COLORED:
        return 'assets/logos/colored/menshi_icon_colored_$theme.svg';
      case LogoContext.ICON:
        return 'assets/logos/icon/menshi_icon_$theme.svg';
      case LogoContext.SHORT:
        return 'assets/logos/short/menshi_short_$theme.svg';
      case LogoContext.LONG:
        return 'assets/logos/long/menshi_long_$theme.svg';
      default:
        return 'assets/logos/icon/menshi_icon_$theme.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    final svgAssetPath = _getSvgAssetPath();

    return SvgPicture.asset(
      svgAssetPath,
      width: width ?? MediaQuery.of(context).size.width * 0.25,
      height: height,
      semanticsLabel: '$logoContext logo',
    );
  }
}

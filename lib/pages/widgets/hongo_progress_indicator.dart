import 'package:flutter/material.dart';

import 'package:progress_indicators/progress_indicators.dart';

import '../../icons_bottom_nav_icons.dart';

class HongoProgressIndicator extends StatelessWidget {
  const HongoProgressIndicator({
    Key key,
    this.font,
  }) : super(key: key);
  final double font;

  @override
  Widget build(BuildContext context) {
    return GlowingProgressIndicator(
        child: Icon(
      IconsBottomNav.hongo,
      size: font,
    ));
  }
}

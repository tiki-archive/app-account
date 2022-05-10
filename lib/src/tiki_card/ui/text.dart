import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class TikiCardUiText extends StatelessWidget {
  final String text;

  const TikiCardUiText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontFamily: TextProvider.familyNunitoSans,
            package: 'tiki_style',
            color: ColorProvider.tikiBlue,
            height: 1.2,
            fontWeight: FontWeight.w600,
            fontSize: SizeProvider.instance.text(14)));
  }
}

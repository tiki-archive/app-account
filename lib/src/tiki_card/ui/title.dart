import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class TikiCardUiTitle extends StatelessWidget {
  final String? title;
  final Color? textColor;

  const TikiCardUiTitle(this.title, {Key? key, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title ?? "",
        style: TextStyle(
            color: textColor ?? ColorProvider.tikiPurple,
            fontSize: SizeProvider.instance.text(18),
            fontFamily: TextProvider.familyNunitoSans,
            package: 'tiki_style',
            fontWeight: FontWeight.w800));
  }
}

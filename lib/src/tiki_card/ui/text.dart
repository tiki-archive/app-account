import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class TikiCardUiText extends StatelessWidget {
  final String text;

  const TikiCardUiText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: SizeProvider.instance.text(15),
            fontWeight: FontWeight.w300));
  }
}

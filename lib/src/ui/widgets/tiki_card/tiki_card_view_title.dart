import 'package:flutter/material.dart';

class TikiCardViewTitle extends StatelessWidget {
  final String? title;
  final Color? textColor;

  const TikiCardViewTitle(this.title, {Key? key, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title ?? "",
        style: TextStyle(
            color: textColor ?? const Color(0xFF27002E),
            fontSize: 14,
            fontWeight: FontWeight.w800));
  }
}

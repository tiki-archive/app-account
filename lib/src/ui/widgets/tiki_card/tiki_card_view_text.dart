import 'package:flutter/material.dart';

class TikiCardViewText extends StatelessWidget {
  final String text;

  const TikiCardViewText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600));
  }
}

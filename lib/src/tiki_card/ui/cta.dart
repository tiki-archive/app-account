import 'package:flutter/material.dart';

abstract class TikiCardUiCta extends StatelessWidget {
  const TikiCardUiCta({Key? key}) : super(key: key);

  Widget getCta();

  @override
  Widget build(BuildContext context) {
    return getCta();
  }
}

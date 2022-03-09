import 'package:flutter/material.dart';

abstract class TikiCardViewCta extends StatelessWidget {
  const TikiCardViewCta({Key? key}) : super(key: key);

  Widget getCta();

  @override
  Widget build(BuildContext context) {
    return getCta();
  }
}

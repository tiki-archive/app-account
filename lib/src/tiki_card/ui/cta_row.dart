import 'package:flutter/material.dart';

import 'cta.dart';

class TikiCardUiCtaRow extends TikiCardUiCta {
  final List<Widget> ctas;

  const TikiCardUiCtaRow(this.ctas, {Key? key}) : super(key: key);

  @override
  Widget getCta() {
    return Container(
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ctas,
        ));
  }
}

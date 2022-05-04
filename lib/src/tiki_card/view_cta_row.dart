import 'package:flutter/material.dart';

import 'view_cta.dart';

class TikiCardViewCtaRow extends TikiCardViewCta {
  final List<Widget> ctas;

  const TikiCardViewCtaRow(this.ctas, {Key? key}) : super(key: key);

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

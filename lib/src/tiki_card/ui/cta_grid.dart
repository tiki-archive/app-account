import 'package:flutter/material.dart';

import 'cta.dart';

class TikiCardUiCtaGrid extends TikiCardUiCta {
  final List<Widget> ctas;

  const TikiCardUiCtaGrid(this.ctas, {Key? key}) : super(key: key);

  Widget buildGrid() {
    return Column(
      children: [
        Row(
          children: [ctas[0], ctas[1]],
        ),
        Row(
          children: [ctas[2], ctas[3]],
        )
      ],
    );
  }

  @override
  Widget getCta() {
    return Container(child: buildGrid());
  }
}

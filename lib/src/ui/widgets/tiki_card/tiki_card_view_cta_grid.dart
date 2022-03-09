import 'package:flutter/material.dart';

import 'tiki_card_view_cta.dart';

class TikiCardViewCtaGrid extends TikiCardViewCta {
  final List<Widget> ctas;

  const TikiCardViewCtaGrid(this.ctas, {Key? key}) : super(key: key);

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

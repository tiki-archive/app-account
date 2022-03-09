import 'package:flutter/material.dart';

import 'tiki_card_view_cta.dart';

class TikiCardViewCtaInline extends TikiCardViewCta {
  final Text headline;
  final Icon trailingIcon;

  final Function? callback;

  const TikiCardViewCtaInline(this.headline, this.trailingIcon, this.callback, {Key? key}) : super(key: key);

  @override
  Widget getCta() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      headline,
      IconButton(
        padding: const EdgeInsets.only(left: 4),
        alignment: Alignment.centerLeft,
        icon: trailingIcon,
        onPressed: () => callback!(),
      )
    ]);
  }
}

import 'package:flutter/material.dart';

import 'cta.dart';

class TikiCardUiCtaInline extends TikiCardUiCta {
  final Text headline;
  final Icon trailingIcon;

  final Function? callback;

  const TikiCardUiCtaInline(this.headline, this.trailingIcon, this.callback,
      {Key? key})
      : super(key: key);

  @override
  Widget getCta() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      headline,
      IconButton(
        onPressed: () => callback!(),
        padding: const EdgeInsets.only(left: 4),
        alignment: Alignment.centerLeft,
        icon: trailingIcon,
      )
    ]);
  }
}

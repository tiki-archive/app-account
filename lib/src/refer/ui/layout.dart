/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'code.dart';
import 'count.dart';
import 'text.dart';

class ReferUiLayout extends StatelessWidget {
  const ReferUiLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const ReferUiText(),
      Container(
          margin: EdgeInsets.only(
              top: SizeProvider.instance.width(12),
              left: SizeProvider.instance.width(30),
              right: SizeProvider.instance.width(30)),
          child: const ReferUiCode()),
      Container(
          margin: EdgeInsets.only(top: SizeProvider.instance.width(8.12)),
          child: const ReferUiCount())
    ]);
  }
}

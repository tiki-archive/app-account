/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'code.dart';
import 'count.dart';
import 'text.dart';

class Refer extends StatelessWidget {
  const Refer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const ReferUiText(),
      Container(
          padding: EdgeInsets.only(
            top: SizeProvider.instance.height(8),
          ),
          width: SizeProvider.instance.width(230),
          child: const ReferUiCode()),
      Container(
          margin: EdgeInsets.only(top: SizeProvider.instance.height(3)),
          child: const ReferUiCount())
    ]);
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../service.dart';

class ReferUiCount extends StatelessWidget {
  static const double _fontSize = 14;
  static const String _text = " people joined";

  const ReferUiCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReferService service = Provider.of<ReferService>(context);
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Container(
        margin: EdgeInsets.only(right: SizeProvider.instance.width(6)),
        child: Icon(IconProvider.person,
            size: SizeProvider.instance.text(15),
            color: ColorProvider.green),
      ),
      Text(service.referCount.toString() + _text,
          style: TextStyle(
              fontFamily: TextProvider.familyNunitoSans,
              package: 'tiki_style',
              fontSize: SizeProvider.instance.text(_fontSize),
              fontWeight: FontWeight.w600,
              color: const Color(0xFF00B272)))
    ]);
  }
}

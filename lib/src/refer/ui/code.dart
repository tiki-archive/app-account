/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../service.dart';

class ReferUiCode extends StatelessWidget {
  static const String _text = "YOUR CODE:";
  static const double _fontSize = 14;

  const ReferUiCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReferService service = Provider.of<ReferService>(context);
    return OutlinedButton(
        onPressed: () async => service.controller.copyLink(context),
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFFAFAFAF)),
            primary: ColorProvider.greyThree,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(SizeProvider.instance.width(8))))),
        child: Padding(padding: EdgeInsets.all(SizeProvider.instance.size(4)), child: Row(mainAxisSize: MainAxisSize.min, children: [
          Row(mainAxisSize: MainAxisSize.min, children: [
            Text(_text,
                style: TextStyle(
                    fontSize: SizeProvider.instance.text(_fontSize),
                    fontWeight: FontWeight.bold,
                    color: ColorProvider.greyFour)),
            Container(
                margin: EdgeInsets.all(SizeProvider.instance.width(8)),
                child: Text(service.referCode,
                    style: TextStyle(
                        fontSize: SizeProvider.instance.text(_fontSize),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF00133F))))
          ]),
          Icon(IconProvider.copy, size: SizeProvider.instance.text(_fontSize), color: ColorProvider.greyFour),
        ])));
  }
}

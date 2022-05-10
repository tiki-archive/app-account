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
  static const double _fontSize = 16;

  const ReferUiCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReferService service = Provider.of<ReferService>(context);
    return OutlinedButton(
        onPressed: () async => service.controller.copyLink(context),
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: ColorProvider.greyThree),
            primary: ColorProvider.greyThree,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeProvider.instance.width(8))))),
        child: Padding(
              padding: EdgeInsets.only(
                      top: SizeProvider.instance.height(10),
                      bottom: SizeProvider.instance.height(10),
                      left: SizeProvider.instance.height(10),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                Text(_text,
                    style: TextStyle(
                        fontFamily: TextProvider.familyNunitoSans,
                        package: 'tiki_style',
                        fontSize: SizeProvider.instance.text(_fontSize),
                        fontWeight: FontWeight.w700,
                        color: ColorProvider.greyFive)),
                Container(
                    margin: EdgeInsets.only(
                        left:SizeProvider.instance.width(11)),
                    child: Text("KA3F", //service.referCode,
                        style: TextStyle(
                            fontFamily: TextProvider.familyNunitoSans,
                            package: 'tiki_style',
                            fontSize: SizeProvider.instance.text(_fontSize),
                            fontWeight: FontWeight.w700,
                            color: ColorProvider.tikiBlue)))
              ]),
              Icon(IconProvider.copy,
                  size: SizeProvider.instance.text(19),
                  color: ColorProvider.tikiPurple),
            ])));
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class UserAccountUiHeader extends StatelessWidget {
  static const String _text = "Account";

  const UserAccountUiHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: SizeProvider.instance.height(20)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: null,
                  child: Container(
                      alignment: Alignment.center,
                      child: Container(
                          padding: EdgeInsets.only(left: SizeProvider.instance.size(25)),
                          child: Center(
                              child: SizedBox.fromSize(
                                  size: Size(SizeProvider.instance.size(10),SizeProvider.instance.size(10))))))),
              Container(
                  alignment: Alignment.center,
                  child: Text(_text,
                      style: TextStyle(
                          color: ColorProvider.tikiPurple,
                          fontWeight: FontWeight.w800,
                          fontFamily: TextProvider.familyNunitoSans,
                          package: 'tiki_style',
                          fontSize: SizeProvider.instance.size(16)))),
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                          padding: EdgeInsets.only(right: SizeProvider.instance.size(25)),
                          child: const Center(
                              child: Icon(IconProvider.x, size: 18)
                          )))),
            ]));
  }
}

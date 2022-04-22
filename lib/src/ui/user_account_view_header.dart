/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:style/style.dart';


class UserAccountViewHeader extends StatelessWidget {
  static const String _text = "Account";
  static const num _paddingHoriz = 6;
  static const num _paddingVert = 2.5;


  const UserAccountViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop(),
          child: Container(
              alignment: Alignment.centerRight,
              child: Container(
                  width: SizeProvider.instance.width(3.75*_paddingHoriz * 3),
                  height: SizeProvider.instance.width(3.75*_paddingVert * 3),
                  padding: EdgeInsets.only(right: SizeProvider.instance.width(3.75*_paddingHoriz)),
                  child: Center(
                      child: Image.asset('res/images/icon-x.png',
                    width: SizeProvider.instance.text(12),
                    height: SizeProvider.instance.text(12),
                    package:'user_account'),
                  )))),
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            top: SizeProvider.instance.width(_paddingVert * 8.12),
          ),
          child: Text(_text,
              style: TextStyle(
                  color: const Color(0xFF27002E),
                  fontWeight: FontWeight.w800,
                  fontSize: SizeProvider.instance.text(12)))),
    ]);
  }
}

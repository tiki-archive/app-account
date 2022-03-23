/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import '../user_account_style.dart';

class UserAccountViewHeader extends StatelessWidget {
  static const String _text = "Account";
  static const num _paddingHoriz = 6;
  static const num _paddingVert = 2.5;
  final UserAccountStyle style;

  const UserAccountViewHeader({Key? key, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop(),
          child: Container(
              alignment: Alignment.centerRight,
              child: Container(
                  width: style.size(3.75*_paddingHoriz * 3),
                  height: style.size(3.75*_paddingVert * 3),
                  padding: EdgeInsets.only(right: style.size(3.75*_paddingHoriz)),
                  child: Center(
                      child: Image.asset('res/images/icon-x.png',
                    width: style.text(12),
                    height: style.text(12),
                    package:'user_account'),
                  )))),
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            top: style.size(_paddingVert * 8.12),
          ),
          child: Text(_text,
              style: TextStyle(
                  color: const Color(0xFF27002E),
                  fontWeight: FontWeight.w800,
                  fontSize: style.text(12)))),
    ]);
  }
}

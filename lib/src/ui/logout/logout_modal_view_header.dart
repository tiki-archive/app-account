/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import '../../user_account_style.dart';

class LogoutModalViewHeader extends StatelessWidget {
  static const double _paddingVert = 20;

  final UserAccountStyle style;

  const LogoutModalViewHeader({Key? key, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            top: style.size(_paddingVert),
            bottom: style.size(_paddingVert),
          ),
          child: Image.asset('res/images/modal-top.png', package: 'user_account'))
    ]);
  }
}

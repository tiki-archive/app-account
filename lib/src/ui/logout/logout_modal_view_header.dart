/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import '../../user_account_style.dart';

class LogoutModalViewHeader extends StatelessWidget {
  static const double _paddingVert = 20;



  const LogoutModalViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            top: SizeProvider.instance.width(_paddingVert),
            bottom: SizeProvider.instance.width(_paddingVert),
          ),
          child: Image.asset('res/images/modal-top.png', package: 'user_account'))
    ]);
  }
}

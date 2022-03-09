/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../config/config_color.dart';

class UserAccountViewProfileAvatar extends StatelessWidget {
  static const num _labelWidth = 26.5;

  final String label;
  final String avatar;
  final UserAccountStyle style;
  UserAccountViewProfileAvatar(
      {required this.label, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image(
          image: AssetImage('res/images/' + avatar + '.png'),
          height: style.size(10*8.12),
          fit: BoxFit.fitHeight,
        ),
        Stack(alignment: AlignmentDirectional.center, children: [
          Image(
            image: AssetImage('res/images/badge-account.png'),
            width: _labelWidth.w,
            fit: BoxFit.fitWidth,
          ),
          Container(
              width: _labelWidth.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: style.text(8)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: style.size(1*3.75)),
                      child: Image(
                        image: AssetImage('res/images/icon-star.png'),
                        height: 8.sp,
                        fit: BoxFit.fitHeight,
                      )),
                ],
              ))
        ])
      ],
    );
  }
}

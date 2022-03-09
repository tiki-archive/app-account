/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import '../user_account_style.dart';

class UserAccountViewProfileAvatar extends StatelessWidget {
  static const double _labelWidth = 26.5;

  final String label;
  final String avatar;
  final UserAccountStyle style;
  
  const UserAccountViewProfileAvatar(
      {Key? key, required this.label, required this.avatar, required this.style}) : super(key: key);

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
            image: const AssetImage('res/images/badge-account.png'),
            width: style.size(_labelWidth),
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
              width: style.size(_labelWidth),
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
                        image: const AssetImage('res/images/icon-star.png'),
                        height: style.text(8),
                        fit: BoxFit.fitHeight,
                      )),
                ],
              ))
        ])
      ],
    );
  }
}

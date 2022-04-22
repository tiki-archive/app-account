/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:style/style.dart';


class UserAccountViewProfileAvatar extends StatelessWidget {
  static const double _labelWidth = 26.5;

  final String label;
  final String avatar;

  
  const UserAccountViewProfileAvatar(
      {Key? key, required this.label, required this.avatar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image.asset('res/images/' + avatar + '.png',
          height: SizeProvider.instance.width(10*8.12),
          fit: BoxFit.fitHeight,
          package: 'user_account'
        ),
        Stack(alignment: AlignmentDirectional.center, children: [
          Image.asset('res/images/badge-account.png',
            width: SizeProvider.instance.width(_labelWidth*3.75),
            fit: BoxFit.fitWidth,
            package: 'user_account'
          ),
          SizedBox(
              width: SizeProvider.instance.width(_labelWidth*3.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: SizeProvider.instance.text(8)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: SizeProvider.instance.width(1*3.75)),
                      child: Image.asset('res/images/icon-star.png',
                        height: SizeProvider.instance.text(8),
                        fit: BoxFit.fitHeight,
                        package: 'user_account'
                      )),
                ],
              ))
        ])
      ],
    );
  }
}

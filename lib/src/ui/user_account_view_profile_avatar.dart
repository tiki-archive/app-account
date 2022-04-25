/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:style/style.dart';


class UserAccountViewProfileAvatar extends StatelessWidget {
  static const double _labelWidth = 26.5;

  final String label;
  final Image avatar;

  
  const UserAccountViewProfileAvatar(
      {Key? key, required this.label, required this.avatar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
       SizedBox(
          height: SizeProvider.instance.width(10*8.12),
          child: avatar
        ),
        Stack(alignment: AlignmentDirectional.center, children: [
         SizedBox(
            width: SizeProvider.instance.width(_labelWidth*3.75),
            child: ImgProvider.badgeAccount
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
                      child: Icon(IconProvider.star,
                        size: SizeProvider.instance.text(8)),
                      ),
                ],
              ))
        ])
      ],
    );
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';


class UserAccountUiProfileAvatar extends StatelessWidget {
  static const double _labelWidth = 26.5;

  final String label;
  final Image avatar;

  
  const UserAccountUiProfileAvatar(
      {Key? key, required this.label, required this.avatar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
       SizedBox(
          height: SizeProvider.instance.height(95),
          width: SizeProvider.instance.width(95),
          child: FittedBox( child: avatar, fit: BoxFit.fill)
        ),
        Stack(alignment: AlignmentDirectional.center, children: [
         SizedBox(
            width: SizeProvider.instance.width(115),
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
                        fontSize: SizeProvider.instance.text(11)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: SizeProvider.instance.width(1*3.75)),
                      child: Icon(IconProvider.star,
                        size: SizeProvider.instance.text(11),
                        color: Colors.white),
                      ),
                ],
              ))
        ])
      ],
    );
  }
}

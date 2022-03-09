/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../config/config_color.dart';

class UserAccountViewBadgesSelect extends StatelessWidget {
  final bool isSelected;
  final String image;
  final String label;
  final UserAccountStyle style;
  UserAccountViewBadgesSelect(
      {required this.image, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "Koara",
              fontWeight: FontWeight.bold,
              fontSize: style.text(10),
              color: isSelected ? Color(0xFF00133F) : ConfigColor.greyFive),
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              boxShadow: [
                BoxShadow(
                  color: Color(0x08000000),
                  blurRadius: style.size(0.75*3.75),
                  offset: Offset(-0.5.w,style.size(0.75*3.75)), // Shadow position
                ),
              ],
            ),
            padding: EdgeInsets.only(top: style.size(0.5*8.12)),
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Image(
                  image: AssetImage(isSelected
                      ? 'res/images/' + image + '-active.png'
                      : 'res/images/' + image + '-inactive.png'),
                  width: style.size(15*3.75),
                  fit: BoxFit.fitWidth,
                ),
              ],
            ))
      ],
    );
  }
}

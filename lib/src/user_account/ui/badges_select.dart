/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class UserAccountUiBadgesSelect extends StatelessWidget {
  final bool isSelected;
  final Image image;
  final String label;

  const UserAccountUiBadgesSelect({
    Key? key,
    required this.image,
    required this.label,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: TextProvider.familyKoara,
              package: 'tiki_style',
              fontWeight: FontWeight.bold,
              fontSize: SizeProvider.instance.text(11),
              color: isSelected
                  ? const Color(0xFF00133F)
                  : ColorProvider.greyFour),
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(SizeProvider.instance.width(36)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x08000000),
                  blurRadius: SizeProvider.instance.width(0.75 * 3.75),
                  offset: Offset(
                      SizeProvider.instance.width(-0.5 * 3.75),
                      SizeProvider.instance
                          .width(0.75 * 3.75)), // Shadow position
                ),
              ],
            ),
            padding:
                EdgeInsets.only(top: SizeProvider.instance.width(0.5 * 8.12)),
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                SizedBox(
                    width: SizeProvider.instance.width(15 * 3.75),
                    child: image),
              ],
            ))
      ],
    );
  }
}

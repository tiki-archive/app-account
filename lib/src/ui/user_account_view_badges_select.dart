/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import '../user_account_style.dart';

class UserAccountViewBadgesSelect extends StatelessWidget {
  final bool isSelected;
  final String image;
  final String label;
  final UserAccountStyle style;

  const UserAccountViewBadgesSelect({
    Key? key,
    required this.image,
    required this.label,
    this.isSelected = false,
    required this.style}) : super(key: key);

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
              color: isSelected ? const Color(0xFF00133F) : const Color(0xFF8D8D8D)),
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(style.size(36)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x08000000),
                  blurRadius: style.size(0.75*3.75),
                  offset: Offset(style.size(-0.5*3.75),style.size(0.75*3.75)), // Shadow position
                ),
              ],
            ),
            padding: EdgeInsets.only(top: style.size(0.5*8.12)),
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Image.asset(isSelected
                      ? 'res/images/' + image + '-active.png'
                      : 'res/images/' + image + '-inactive.png',
                  package: 'user_account',
                  width: style.size(15*3.75),
                  fit: BoxFit.fitWidth,
                ),
              ],
            ))
      ],
    );
  }
}

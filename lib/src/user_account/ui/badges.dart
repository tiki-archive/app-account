/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'badges_select.dart';

class UserAccountUiBadges extends StatelessWidget {
  static const String _soon = "COMING SOON";
  static const String _text =
      "Make more choices to win badges. \nChoose a badge to be your avatar.";
  static const String _badgeBeta = "Beta \ntester";
  static const String _badgeSoon = "Coming \nsoon";

  const UserAccountUiBadges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(24)),
      padding: EdgeInsets.only(
          top: SizeProvider.instance.width(3 * 8.12),
          left: SizeProvider.instance.width(6 * 3.75),
          right: SizeProvider.instance.width(6 * 3.75),
          bottom: SizeProvider.instance.width(3 * 8.12)),
      child: Column(
        children: [
          Text(
            _soon,
            style: TextStyle(
                fontWeight: FontWeight.w800,
                color: const Color(0xFF00133F),
                fontSize: SizeProvider.instance.text(14)),
          ),
          Padding(
              padding: EdgeInsets.only(top: SizeProvider.instance.width(12)),
              child: Text(_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF00133F),
                      fontSize: SizeProvider.instance.text(12)))),
          Padding(
              padding: EdgeInsets.only(top: SizeProvider.instance.width(24)),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserAccountUiBadgesSelect(
                        image: ImgProvider.badgeBetaActive,
                        label: _badgeBeta,
                        isSelected: true),
                    UserAccountUiBadgesSelect(
                        image: ImgProvider.badgeAlt1Inactive,
                        label: _badgeSoon,
                        isSelected: false),
                    UserAccountUiBadgesSelect(
                        image: ImgProvider.badgeAlt2Inactive,
                        label: _badgeSoon,
                        isSelected: false),
                    UserAccountUiBadgesSelect(
                        image: ImgProvider.badgeAlt3Inactive,
                        label: _badgeSoon,
                        isSelected: false),
                  ])),
          Padding(
              padding: EdgeInsets.only(top: SizeProvider.instance.width(12)),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserAccountUiBadgesSelect(
                    image: ImgProvider.badgeAlt4Inactive,
                    label: _badgeSoon,
                    isSelected: false,
                  ),
                  UserAccountUiBadgesSelect(
                    image: ImgProvider.badgeAlt5Inactive,
                    label: _badgeSoon,
                    isSelected: false,
                  ),
                  UserAccountUiBadgesSelect(
                    image: ImgProvider.badgeAlt6Inactive,
                    label: _badgeSoon,
                    isSelected: false,
                  ),
                  UserAccountUiBadgesSelect(
                    image: ImgProvider.badgeAlt7Inactive,
                    label: _badgeSoon,
                    isSelected: false,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

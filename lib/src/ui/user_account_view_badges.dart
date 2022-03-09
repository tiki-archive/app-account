/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';

import '../user_account_style.dart';
import 'user_account_view_badges_select.dart';

class UserAccountViewBadges extends StatelessWidget {
  static const String _soon = "COMING SOON";
  static const String _text =
      "Make more choices to win badges. \nChoose a badge to be your avatar.";
  static const String _badgeBeta = "Beta \ntester";
  static const String _badgeSoon = "Coming \nsoon";

  final UserAccountStyle style;

  const UserAccountViewBadges({Key? key, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0), borderRadius: BorderRadius.circular(24)),
      padding: EdgeInsets.only(top: style.size(3*8.12), left: style.size(6*3.75), right: style.size(6*3.75), bottom: style.size(3*8.12)),
      child: Column(
        children: [
          Text(
            _soon,
            style: TextStyle(
                fontWeight: FontWeight.w800,
                color: const Color(0xFF00133F),
                fontSize: style.text(14)),
          ),
          Padding(
              padding: EdgeInsets.only(top: style.size(1.25*8.12)),
              child: Text(_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF00133F),
                      fontSize: style.text(11)))),
          Padding(
              padding: EdgeInsets.only(top: style.size(3*8.12)),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserAccountViewBadgesSelect(
                        image: "badge-beta",
                        label: _badgeBeta,
                        isSelected: true),
                    UserAccountViewBadgesSelect(
                        image: "badge-alt-1",
                        label: _badgeSoon,
                        isSelected: false),
                    UserAccountViewBadgesSelect(
                        image: "badge-alt-2",
                        label: _badgeSoon,
                        isSelected: false),
                    UserAccountViewBadgesSelect(
                        image: "badge-alt-3",
                        label: _badgeSoon,
                        isSelected: false),
                  ])),
          Padding(
              padding: EdgeInsets.only(top: style.size(1.25*8.12)),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserAccountViewBadgesSelect(
                      image: "badge-alt-4",
                      label: _badgeSoon,
                      isSelected: false),
                  UserAccountViewBadgesSelect(
                      image: "badge-alt-5",
                      label: _badgeSoon,
                      isSelected: false),
                  UserAccountViewBadgesSelect(
                      image: "badge-alt-6",
                      label: _badgeSoon,
                      isSelected: false),
                  UserAccountViewBadgesSelect(
                      image: "badge-alt-7",
                      label: _badgeSoon,
                      isSelected: false),
                ],
              ))
        ],
      ),
    );
  }
}

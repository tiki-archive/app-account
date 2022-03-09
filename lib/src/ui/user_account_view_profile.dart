/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../config/config_color.dart';
import 'user_account_modal_view_profile_avatar.dart';

class UserAccountViewProfile extends StatelessWidget {
  static const String _avatarImage = "badge-beta-avatar";
  static const String _avatarLabel = "BETA TESTER";
  static const String _member = "TIKI tribe member";
  final UserAccountStyle style;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAccountViewProfileAvatar(
          avatar: _avatarImage,
          label: _avatarLabel,
        ),
        Padding(
            padding: EdgeInsets.only(top: style.size(4*8.12)),
            child: Text(
              _member,
              style: TextStyle(
                  color: Color(0xFF00133F),
                  fontFamily: "Koara",
                  fontWeight: FontWeight.bold,
                  style.text(20)),
            ))
      ],
    );
  }
}

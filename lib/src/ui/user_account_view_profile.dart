/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'user_account_view_profile_avatar.dart';

class UserAccountViewProfile extends StatelessWidget {

  static const String _avatarLabel = "BETA TESTER";
  static const String _member = "TIKI tribe member";


  const UserAccountViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    Padding(
    padding: EdgeInsets.only(top: SizeProvider.instance.height(20))),

    UserAccountViewProfileAvatar(
          avatar: ImgProvider.badgeBetaAvatar,
          label: _avatarLabel
        ),
        Padding(
            padding: EdgeInsets.only(top: SizeProvider.instance.height(4*8.12)),
            child: Text(
              _member,
              style: TextStyle(
                  color: const Color(0xFF00133F),
                  fontFamily: TextProvider.familyKoara, package: 'tiki_style',
                  fontWeight: FontWeight.bold,
                  fontSize: SizeProvider.instance.text(28)),
            ))
      ],
    );
  }
}

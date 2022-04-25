/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:style/style.dart';

import 'user_referral_view_code.dart';
import 'user_referral_view_count.dart';
import 'user_referral_view_text.dart';

class UserReferralLayout extends StatelessWidget {

  const UserReferralLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const UserReferralViewText(),
      Container(
          margin: EdgeInsets.only(
              top: SizeProvider.instance.width(12),
              left: SizeProvider.instance.width(30),
              right: SizeProvider.instance.width(30)),
          child: const UserReferralViewCode()),
      Container(
          margin: EdgeInsets.only(top: SizeProvider.instance.width(8.12)), child: const UserReferralViewCount())
    ]);
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../user_account_service.dart';
import 'user_referral_view_code.dart';
import 'user_referral_view_count.dart';
import 'user_referral_view_text.dart';

class UserReferralLayout extends StatelessWidget {

  const UserReferralLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAccountService service = Provider.of<UserAccountService>(context);
    return Column(children: [
      UserReferralViewText(),
      Container(
          margin: EdgeInsets.only(
              top: service.style.size(12),
              left: service.style.size(30),
              right: service.style.size(30)),
          child: UserReferralViewCode()),
      Container(
          margin: EdgeInsets.only(top: service.style.size(8.12)), child: UserReferralViewCount())
    ]);
  }
}

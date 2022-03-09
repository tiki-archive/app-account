/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../config/config_color.dart';
import '../../user_referral/user_referral_service.dart';
import '../user_account_modal_controller.dart';
import '../user_account_modal_service.dart';

class UserAccountViewReferShare extends StatelessWidget {
  final UserAccountStyle style;
  static const String _text = "SHARE";

  @override
  Widget build(BuildContext context) {
    UserAccountService UserAccountService =
        Provider.of<UserAccountService>(context);
    UserAccountController controller = UserAccountService.controller;
    UserReferralService userReferralService =
        UserAccountService.referralService;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: style.size(1.25*8.12)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.h))),
            primary: ConfigColor.tikiPurple),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.only(right: style.size(5*3.75)),
                child: Text(_text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: style.text(18),
                      letterSpacing: style.size(0.05*3.75),
                    ))),
            Icon(
              Icons.share,
              size: 18.sp * 1.2,
            ),
          ],
        ),
        onPressed: () => controller.onShare(userReferralService));
  }
}

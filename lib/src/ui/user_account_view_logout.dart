/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../config/config_color.dart';
import '../../../utils/helper_image.dart';
import '../user_account_modal_service.dart';

class UserAccountViewLogout extends StatelessWidget {
  static const String _text = "Log out";
  final UserAccountStyle style;
  @override
  Widget build(BuildContext context) {
    var service = Provider.of<UserAccountService>(context);
    return TextButton(
        onPressed: () => service.controller.onLogout(context),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_text,
                style: TextStyle(
                    color: ConfigColor.tikiRed,
                    fontWeight: FontWeight.bold,
                    fontSize: style.text(15))),
            Container(
                margin: EdgeInsets.only(left: style.size(3*3.75)),
                child: Image.asset("res/images/icon-logout.png", package: "user_account", height: 15.sp))
          ],
        ));
  }
}

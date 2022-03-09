/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../config/config_color.dart';
import '../user_account_modal_service.dart';

class UserAccountViewReferCount extends StatelessWidget {
  final UserAccountStyle style;
  static const String _text = "people joined the TIKI tribe";

  @override
  Widget build(BuildContext context) {
    var service = Provider.of<UserAccountService>(context);
    service.controller.updateUserCount();
    return Column(children: [
      Text(
          service.model.signupCount?.toString().replaceAllMapped(
                  new RegExp(r'(\d{1,3})(?=(\d{3})+$)'), (m) => "${m[1]},") ??
              "...",
          style: TextStyle(
              color: ConfigColor.tikiPink,
              fontFamily: 'Koara',
              fontWeight: FontWeight.bold,
              height: 0,
              fontSize: style.text(63))),
      Text(_text,
          style: TextStyle(
              fontSize: style.text(14),
              height: 2.25,
              fontWeight: FontWeight.w800,
              color: Color(0xFF00133F)))
    ]);
  }
}

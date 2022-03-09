/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../user_account_service.dart';
import '../user_account_style.dart';

class UserAccountViewLogout extends StatelessWidget {
  static const String _text = "Log out";
  final UserAccountStyle style;

  const UserAccountViewLogout({Key? key, required this.style}) : super(key: key);

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
                    color: const Color(0xFFC73000),
                    fontWeight: FontWeight.bold,
                    fontSize: style.text(15))),
            Container(
                margin: EdgeInsets.only(left: style.size(3*3.75)),
                child: Image.asset("res/images/icon-logout.png", package: "user_account", height: style.text(15)))
          ],
        ));
  }
}

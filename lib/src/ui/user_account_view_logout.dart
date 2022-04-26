/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';
import '../user_account_service.dart';


class UserAccountViewLogout extends StatelessWidget {
  static const String _text = "Log out";


  const UserAccountViewLogout({Key? key}) : super(key: key);

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
                    fontSize: SizeProvider.instance.text(15))),
            Container(
                margin: EdgeInsets.only(left: SizeProvider.instance.width(3*3.75)),
                child: Icon(IconProvider.logout, size:SizeProvider.instance.text(15)))
          ],
        ));
  }
}

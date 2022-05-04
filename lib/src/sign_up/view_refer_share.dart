/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';
import '../user_account/user_account_controller.dart';
import '../user_account/user_account_service.dart';


class UserAccountViewReferShare extends StatelessWidget {

  static const String _text = "SHARE";

  const UserAccountViewReferShare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAccountService service = Provider.of<UserAccountService>(context);
    UserAccountController controller = service.controller;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: SizeProvider.instance.width(10)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(SizeProvider.instance.width(80)))),
            primary: const Color(0xFF27002E)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.only(right: SizeProvider.instance.width(18)),
                child: Text(_text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: SizeProvider.instance.text(18),
                      letterSpacing: SizeProvider.instance.width(2),
                    ))),
            Icon(
              Icons.share,
              size: SizeProvider.instance.text(22),
            ),
          ],
        ),
        onPressed: () => controller.onShare());
  }
}

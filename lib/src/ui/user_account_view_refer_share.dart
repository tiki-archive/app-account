/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../user_account_controller.dart';
import '../user_account_service.dart';
import '../user_account_style.dart';

class UserAccountViewReferShare extends StatelessWidget {

  static const String _text = "SHARE";

  const UserAccountViewReferShare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAccountService service = Provider.of<UserAccountService>(context);
    UserAccountStyle style = service.style;
    UserAccountController controller = service.controller;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: style.size(10)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(service.style.size(80)))),
            primary: const Color(0xFF27002E)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.only(right: style.size(18)),
                child: Text(_text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: style.text(18),
                      letterSpacing: style.size(2),
                    ))),
            Icon(
              Icons.share,
              size: service.style.text(22),
            ),
          ],
        ),
        onPressed: () => controller.onShare());
  }
}

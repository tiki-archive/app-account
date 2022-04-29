/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';
import '../../user_account_service.dart';
import 'logout_modal_view_header.dart';

class LogoutModalLayout extends StatelessWidget {

  const LogoutModalLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAccountService service = Provider.of<UserAccountService>(context);
    return SizedBox(
        height: SizeProvider.instance.width(285),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const LogoutModalViewHeader(),
          Padding(padding: EdgeInsets.only(top: SizeProvider.instance.width(24))),
          Expanded(
              child: Column(children: [
            Text("Are you sure you want to log out?",
                style: TextStyle(
                    color: const Color(0xFF00133F),
                    fontSize: SizeProvider.instance.text(14),
                    fontWeight: FontWeight.w800)),
            Padding(padding: EdgeInsets.only(top: SizeProvider.instance.width(12))),
            TextButton(
              style: TextButton.styleFrom(
                  fixedSize: Size.fromWidth(SizeProvider.instance.width(300)),
                  padding: EdgeInsets.symmetric(vertical: SizeProvider.instance.width(16)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(SizeProvider.instance.width(10)))),
                  side: const BorderSide(width: 2, color: Color(0xFFFF521C))),
              child: Text("Log out",
                  style: TextStyle(
                      color: const Color(0xFFFF521C),
                      fontSize: SizeProvider.instance.text(14),
                      fontWeight: FontWeight.bold)),
              onPressed: () => service.controller.logout(context),
            ),
            Padding(padding: EdgeInsets.only(top: SizeProvider.instance.width(8))),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromWidth(SizeProvider.instance.width(300)),
                primary: const Color(0xFFFF521C),
                padding: EdgeInsets.symmetric(vertical: SizeProvider.instance.width(16)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(SizeProvider.instance.width(10)))),
              ),
              child: Text("Cancel",
                  style:
                      TextStyle(fontSize: SizeProvider.instance.text(14), fontWeight: FontWeight.bold)),
              onPressed: () => Navigator.of(context).pop(),
            )
          ]))
        ]));
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../service.dart';

class LogoutUiBtn extends StatelessWidget {
  static const String _text = "Log out";


  const LogoutUiBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var service = Provider.of<LogoutService>(context);
    return TextButton(
        onPressed: () => service.controller.openLogout(context),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_text,
                style: TextStyle(
                    color: ColorProvider.tikiRed,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeProvider.instance.text(15))),
            Container(
                margin: EdgeInsets.only(left: SizeProvider.instance.width(3*3.75)),
                child: Icon(IconProvider.logout, size:SizeProvider.instance.text(15), color: ColorProvider.tikiRed))
          ],
        ));
  }
}

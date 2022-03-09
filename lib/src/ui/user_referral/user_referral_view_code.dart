/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../user_account_service.dart';

class UserReferralViewCode extends StatelessWidget {
  static const String _text = "YOUR CODE:";
  static const double _fontSize = 12;

  const UserReferralViewCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var service = Provider.of<UserAccountService>(context);
    return OutlinedButton(
        onPressed: () async => service.controller.copyLink(context),
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFFAFAFAF)),
            primary: const Color(0xFF8D8D8D),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(service.style.size(8))))),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Row(mainAxisSize: MainAxisSize.min, children: [
            Text(_text,
                style: TextStyle(
                    fontSize: service.style.text(_fontSize),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8D8D8D))),
            Container(
                margin: EdgeInsets.all(service.style.size(8)),
                child: Text(service.model.code,
                    style: TextStyle(
                        fontSize: service.style.text(_fontSize),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF00133F))))
          ]),
          Image.asset("res/images/icon-copy.png", height: service.style.text(_fontSize)),
        ]));
  }
}

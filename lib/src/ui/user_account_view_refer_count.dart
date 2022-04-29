/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';
import '../user_account_service.dart';


class UserAccountViewReferCount extends StatelessWidget {

  static const String _text = "people joined the TIKI tribe";

  const UserAccountViewReferCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var service = Provider.of<UserAccountService>(context);
    return Column(children: [
      Text(
          service.model.signupCount?.toString().replaceAllMapped(
                  RegExp(r'(\d{1,3})(?=(\d{3})+$)'), (m) => "${m[1]},") ??
              "...",
          style: TextStyle(
              color: const Color(0xFFB5006C),
              fontFamily: TextProvider.familyKoara,
              package: 'tiki_style',
              fontWeight: FontWeight.bold,
              height: 0,
              fontSize: SizeProvider.instance.text(63))),
      Text(_text,
          style: TextStyle(
              fontSize: SizeProvider.instance.text(14),
              height: 2.25,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF00133F)))
    ]);
  }
}

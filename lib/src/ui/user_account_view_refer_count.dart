/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../user_account_service.dart';
import '../user_account_style.dart';

class UserAccountViewReferCount extends StatelessWidget {
  final UserAccountStyle style;
  static const String _text = "people joined the TIKI tribe";

  const UserAccountViewReferCount({Key? key, required this.style}) : super(key: key);

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
              fontFamily: 'Koara',
              fontWeight: FontWeight.bold,
              height: 0,
              fontSize: style.text(63))),
      Text(_text,
          style: TextStyle(
              fontSize: style.text(14),
              height: 2.25,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF00133F)))
    ]);
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../user_account_service.dart';

class UserReferralViewText extends StatelessWidget {
  static const String _textL1 = "Share your TIKI code and get";
  static const String _textL2 = "\$5 for every 10 people who join.";
  static const double _fontSize = 11;

  const UserReferralViewText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAccountService service = Provider.of<UserAccountService>(context);
    return Column(
      children: [
        Text(
          _textL1,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: service.style.text(_fontSize),
              fontWeight: FontWeight.w600,
              color: const Color(0xFF00133F)),
        ),
        Text(
          _textL2,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: service.style.text(_fontSize),
              fontWeight: FontWeight.w800,
              color: const Color(0xFF00133F)),
        )
      ],
    );
  }
}

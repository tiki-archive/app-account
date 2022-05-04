import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import '../../user_account/ui/user_account_view_refer_share.dart';
import '../../user_account/ui/user_referral/user_referral_layout.dart';

class UserAccountViewRefer extends StatelessWidget {

  const UserAccountViewRefer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Container(
              //   margin: EdgeInsets.only(top: SizeProvider.instance.width(10*8.12)),
              //   child: UserAccountViewReferCount(),
              // ),
              Container(
                  margin: EdgeInsets.only(top: SizeProvider.instance.width(3.5*8.12)),
                  child: const UserReferralLayout()),
              Container(
                  margin: EdgeInsets.only(
                      top: SizeProvider.instance.width(16), bottom: SizeProvider.instance.width(16), left: SizeProvider.instance.width(50), right: SizeProvider.instance.width(50)),
                  alignment: Alignment.topCenter,
                  child: const UserAccountViewReferShare()),
            ]));
  }
}

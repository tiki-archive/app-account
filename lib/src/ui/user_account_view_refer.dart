import 'package:flutter/material.dart';
import '../user_account_style.dart';
import 'user_account_view_refer_share.dart';
import 'user_referral/user_referral_layout.dart';

class UserAccountViewRefer extends StatelessWidget {

  final UserAccountStyle style;

  const UserAccountViewRefer({Key? key, required this.style}) : super(key: key);

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
              //   margin: EdgeInsets.only(top: style.size(10*8.12)),
              //   child: UserAccountViewReferCount(style: style),
              // ),
              Container(
                  margin: EdgeInsets.only(top: style.size(3.5*8.12)),
                  child: const UserReferralLayout()),
              Container(
                  margin: EdgeInsets.only(
                      top: style.size(4.5*8.12), bottom: style.size(5.5*8.12), left: style.size(13*3.75), right: style.size(13*3.75)),
                  alignment: Alignment.topCenter,
                  child: const UserAccountViewReferShare()),
            ]));
  }
}

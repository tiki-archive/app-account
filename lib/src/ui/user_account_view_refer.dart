import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../config/config_color.dart';
import '../user_account_modal_service.dart';
import '../user_account_service.dart';
import '../user_account_style.dart';
import 'user_account_modal_view_refer_count.dart';
import 'user_account_modal_view_refer_share.dart';

class UserAccountViewRefer extends StatelessWidget {

  final UserAccountStyle style;

  const UserAccountViewRefer({Key? key, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAccountService userAccountService =
        Provider.of<UserAccountService>(context);
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: style.size(10*8.12)),
                child: UserAccountViewReferCount(),
              ),
              Container(
                  margin: EdgeInsets.only(top: style.size(3.5*8.12)),
                  child: UserAccountService.referralService.presenter
                      .render()),
              Container(
                  margin: EdgeInsets.only(
                      top: style.size(4.5*8.12), bottom: style.size(5.5*8.12), left: style.size(13*3.75), right: style.size(13*3.75)),
                  alignment: Alignment.topCenter,
                  child: UserAccountViewReferShare()),
            ]));
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upvoty/upvoty.dart';

import '../../user_account.dart';
import '../user_account_service.dart';
import '../user_account_style.dart';
import 'user_account_view_badges.dart';
import 'user_account_view_community.dart';
import 'user_account_view_follow_us.dart';
import 'user_account_view_header.dart';
import 'user_account_view_logout.dart';
import 'user_account_view_news.dart';
import 'user_account_view_profile.dart';
import 'user_account_view_qr_code_btn.dart';
import 'user_account_view_qr_code_show.dart';
import 'user_account_view_refer.dart';
import 'user_account_view_release.dart';
import 'user_account_view_support.dart';
import 'user_account_view_version.dart';

class UserAccountLayout extends StatelessWidget {
  static const num _cardMarginTop = 2.25;

  static UpvotyStyle style = UpvotyStyle();
  static Upvoty upvoty = Upvoty(style: style, pressBack: (context) {
    Navigator.of(context).pop();
    UserAccount(
        referalCode: "\$0000T",
        logout: () => print('logout'),
        combinedKeys: 'teste')
        .open(context);
  });

  const UserAccountLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAccountService service = Provider.of<UserAccountService>(context);
    UserAccountStyle style = service.style;

    return SizedBox(
        height: style.size(85*8.12),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          UserAccountViewHeader(style: style),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                      padding:
                          EdgeInsets.only(left: style.size(6*3.75), right: style.size(6*3.75), bottom: style.size(5*8.12)),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        UserAccountViewProfile(style: style),
                        Container(
                            margin: EdgeInsets.only(top: style.size(4*8.12)),
                            child: UserAccountViewRefer(style:style)),
                        Container(
                            margin: EdgeInsets.only(top: style.size(_cardMarginTop*8.12)),
                            child: UserAccountViewRelease(style:style)),
                        Container(
                            margin: EdgeInsets.only(top: style.size(_cardMarginTop*8.12)),
                            child: UserAccountViewNews(style:style)),
                        Container(
                            margin: EdgeInsets.only(top: style.size(_cardMarginTop*8.12)),
                            child: UserAccountViewCommunity(style:style)),
                        Container(
                            margin: EdgeInsets.only(top: style.size(_cardMarginTop*8.12)),
                            child: UserAccountViewFollowUs(style:style)),
                        Container(
                            margin: EdgeInsets.only(top: style.size(_cardMarginTop*8.12)),
                            child: UserAccountViewBadges(style:style)),
                        Container(
                            margin: EdgeInsets.only(top: style.size(_cardMarginTop*8.12)),
                            child: service.model.showQrCode
                                ? UserAccountViewQrCodeShow(style:style)
                                : UserAccountViewQrCodeBtn(style:style)),
                        Container(
                            margin: EdgeInsets.only(top: style.size(_cardMarginTop*8.12)),
                            child: const UserAccountViewSupport()),
                        Container(
                            margin: EdgeInsets.only(top: style.size(_cardMarginTop*8.12)),
                            child: upvoty.buttonSuggestions()),
                        Container(
                            margin: EdgeInsets.only(top: style.size(_cardMarginTop*8.12)),
                            child: upvoty.buttonBugs()),
                        Container(
                            margin: EdgeInsets.only(top: style.size(1.5*8.12)),
                            child: UserAccountViewVersion(style:style)),
                        Container(
                            margin: EdgeInsets.only(top: style.size(3*8.12)),
                            child: UserAccountViewLogout(style:style)),
                      ]))))
        ]));
  }
}

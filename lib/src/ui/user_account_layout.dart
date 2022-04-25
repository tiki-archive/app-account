/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:style/style.dart';

import '../user_account_service.dart';

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
  
  const UserAccountLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAccountService service =
        Provider.of<UserAccountService>(context);
    return SizedBox(
        height: SizeProvider.instance.width(85*8.12),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const UserAccountViewHeader(),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                      padding:
                          EdgeInsets.only(left: SizeProvider.instance.width(6*3.75), right: SizeProvider.instance.width(6*3.75), bottom: SizeProvider.instance.width(5*8.12)),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        const UserAccountViewProfile(),
                        Container(
                            margin: EdgeInsets.only(top: SizeProvider.instance.width(4*8.12)),
                            child: const UserAccountViewRefer()),
                        Container(
                            margin: EdgeInsets.only(top: SizeProvider.instance.width(_cardMarginTop*8.12)),
                            child: const UserAccountViewRelease()),
                        Container(
                            margin: EdgeInsets.only(top: SizeProvider.instance.width(_cardMarginTop*8.12)),
                            child: const UserAccountViewNews()),
                        Container(
                            margin: EdgeInsets.only(top: SizeProvider.instance.width(_cardMarginTop*8.12)),
                            child: const UserAccountViewCommunity()),
                        Container(
                            margin: EdgeInsets.only(top: SizeProvider.instance.width(_cardMarginTop*8.12)),
                            child: const UserAccountViewFollowUs()),
                        Container(
                            margin: EdgeInsets.only(top: SizeProvider.instance.width(_cardMarginTop*8.12)),
                            child: const UserAccountViewBadges()),
                        Container(
                            margin: EdgeInsets.only(top: SizeProvider.instance.width(_cardMarginTop*8.12)),
                            child: service.model.showQrCode
                                ? const UserAccountViewQrCodeShow()
                                : const UserAccountViewQrCodeBtn()),
                        Container(
                            margin: EdgeInsets.only(top: SizeProvider.instance.width(_cardMarginTop*8.12)),
                            child: const UserAccountViewSupport()),
                        Container(
                            margin: EdgeInsets.only(top: SizeProvider.instance.width(1.5*8.12)),
                            child: const UserAccountViewVersion()),
                        Container(
                            margin: EdgeInsets.only(top: SizeProvider.instance.width(3*8.12)),
                            child: const UserAccountViewLogout()),
                      ]))))
        ]));
  }
}

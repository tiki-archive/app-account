/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';
import 'package:tiki_upvoty/tiki_upvoty.dart';

import '../service.dart';
import 'badges.dart';
import 'community.dart';
import 'follow_us.dart';
import 'header.dart';
import 'news.dart';
import 'profile.dart';
import 'qr_code_btn.dart';
import 'qr_code_show.dart';
import 'release.dart';
import 'support.dart';
import 'version.dart';

class UserAccountLayout extends StatelessWidget {
  static const num _cardMarginTop = 20;

  const UserAccountLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAccountService service = Provider.of<UserAccountService>(context);
    TikiUpvoty upvoty = TikiUpvoty(pressBack: (context) {
      Navigator.of(context).pop();
      service.presenter.showModal(context);
    });
    return SizedBox(
        height: MediaQuery.of(context).size.height * .90,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const UserAccountUiHeader(),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: SizeProvider.instance.width(24),
                          right: SizeProvider.instance.width(24),
                          bottom: SizeProvider.instance.height(40)),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeProvider.instance.height(0)),
                            child: const UserAccountUiProfile()),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeProvider.instance.height(40)),
                            child: service.refer.presenter.refer),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeProvider.instance
                                    .height(_cardMarginTop)),
                            child: const UserAccountUiRelease()),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeProvider.instance
                                    .height(_cardMarginTop)),
                            child: const UserAccountUiNews()),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeProvider.instance
                                    .height(_cardMarginTop)),
                            child: const UserAccountUiCommunity()),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeProvider.instance
                                    .height(_cardMarginTop)),
                            child: const UserAccountUiFollowUs()),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeProvider.instance
                                    .height(_cardMarginTop)),
                            child: const UserAccountUiBadges()),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeProvider.instance
                                    .height(_cardMarginTop)),
                            child: service.model.showQrCode
                                ? const UserAccountUiQrCodeShow()
                                : const UserAccountUiQrCodeBtn()),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeProvider.instance
                                    .height(_cardMarginTop)),
                            child: const UserAccountUiSupport()),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeProvider.instance
                                    .height(_cardMarginTop)),
                            child: upvoty.buttonSuggestions()),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeProvider.instance
                                    .height(_cardMarginTop)),
                            child: upvoty.buttonBugs()),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeProvider.instance.height(1.5 * 8.12)),
                            child: const UserAccountUiVersion()),
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeProvider.instance.height(3 * 8.12)),
                            child: service.logout.presenter.btn),
                      ]))))
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zendesk_flutter/zendesk_flutter.dart';

import 'user_account_service.dart';

class UserAccountController {
  final UserAccountService service;

  UserAccountController(this.service);

  static const String _linkUrl = "https://mytiki.com/";
  static const String _shareBody =
      "Your data. Your decisions. Take the take power back from corporations. Together, we triumph. Join us! ";
  static const String _shareLink = "https://mytiki.com/";
  static const String _shareSubject = "Have you seen this???";

  void onLogout(BuildContext context) {
    Navigator.of(context).pop();
    service.presenter.showLogoutModal(context);
  }

  Future<void> onShare() async {
    if (service.model.code.isNotEmpty) {
      Share.share(_shareBody + _shareLink + service.model.code,
          subject: _shareSubject);
    }
  }

  void goToSupport(BuildContext context) {
    Navigator.of(context).pop();
    ZendeskFlutter().show(context);
  }

  void showQrCode(BuildContext context) {
    service.showQrCode();
  }

  void logout(BuildContext context) => service.logout();

  copyLink(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: _linkUrl + service.model.code));
  }
}

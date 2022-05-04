import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zendesk_flutter/zendesk_flutter.dart';

import 'service.dart';

class UserAccountController {
  final UserAccountService service;

  UserAccountController(this.service);

  static const String _linkUrl = "https://mytiki.com/";
  static const String _shareBody =
      "Your data. Your decisions. Take the take power back from corporations. Together, we triumph. Join us! ";
  static const String _shareLink = "https://mytiki.com/";
  static const String _shareSubject = "Have you seen this???";

  void showQrCode(BuildContext context) {
    service.showQrCode();
  }

  void goToSupport(BuildContext context) {
    Navigator.of(context).pop();
    ZendeskFlutter().show(context);
  }

}

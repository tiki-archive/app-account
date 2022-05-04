import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zendesk_flutter/zendesk_flutter.dart';

import 'service.dart';

class UserAccountController {
  final UserAccountService service;

  UserAccountController(this.service);

  void showQrCode(BuildContext context) {
    service.showQrCode();
  }

  void goToSupport(BuildContext context) {
    Navigator.of(context).pop();
    ZendeskFlutter().show(context);
  }

}

import 'package:flutter/material.dart';
import 'package:zendesk_flutter/zendesk_flutter.dart';

import 'service.dart';

class UserAccountController {
  final UserAccountService service;

  UserAccountController(this.service);

  /// Reveals the QR code.
  void showQrCode(BuildContext context) {
    service.showQrCode();
  }

  /// Replaces [UserAccountService] bottom sheet with [ZendeskFlutter] bottom sheet.
  void goToSupport(BuildContext context) {
    Navigator.of(context).pop();
    ZendeskFlutter().show(context);
  }

}

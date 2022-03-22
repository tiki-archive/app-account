import 'package:flutter/cupertino.dart';
import 'package:httpp/httpp.dart';

import 'src/user_account_service.dart';
import 'src/user_account_style.dart';

class UserAccount {
  final UserAccountService _service;

  UserAccount(
      {UserAccountStyle? style,
      HttppClient? httppClient,
      required String referalCode,
      required Function logout,
      required String combinedKeys})
      : _service = UserAccountService(
            style: style ?? UserAccountStyle(),
            httppClient: httppClient ?? Httpp().client(),
            referalCode: referalCode,
            logout: logout,
            combinedKeys: combinedKeys);

  open(BuildContext context) {
    _service.presenter.showModal(context);
  }
}

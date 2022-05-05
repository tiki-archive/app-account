import 'package:flutter/cupertino.dart';
import 'package:httpp/httpp.dart';

import 'src/user_account/service.dart';

class TikiUserAccount {
  final UserAccountService _service;

  TikiUserAccount(
      {
      HttppClient? httppClient,
      required Function logout,
      required String combinedKeys,
      required String accessToken})
      : _service = UserAccountService(
            httppClient: httppClient ?? Httpp().client(),
            logoutCallback: logout,
            combinedKeys: combinedKeys,
            accessToken: accessToken);

  /// Opens the user account bottom sheet.
  open(BuildContext context) {
    _service.presenter.showModal(context);
  }
}

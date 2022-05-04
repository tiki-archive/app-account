import 'package:flutter/cupertino.dart';
import 'package:httpp/httpp.dart';

import 'src/user_account/service.dart';


class UserAccount {
  final UserAccountService _service;

  UserAccount({
      HttppClient? httppClient,
      required Function logout,
      required String combinedKeys})
      : _service = UserAccountService(
            httppClient: httppClient ?? Httpp().client(),
            logout: logout,
            combinedKeys: combinedKeys);

  open(BuildContext context) {
    _service.presenter.showModal(context);
  }
}

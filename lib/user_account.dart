import 'package:flutter/cupertino.dart';

import 'src/user_account_service.dart';
import 'src/user_account_style.dart';

class UserAccount {
  final UserAccountService _service;

  UserAccount({
    UserAccountStyle? style,
    required referalCode,
    required login,
    required tikiKeysService,
    required apiSignupService,
    required apiAppDataService}) :
        _service = UserAccountService(
            style: style ?? UserAccountStyle(),
            referalCode: referalCode,
            login: login,
            tikiKeysService: tikiKeysService,
            apiSignupService: apiSignupService,
            apiAppDataService: apiAppDataService);

  open(BuildContext context) {
    _service.presenter.showModal(context);
  }
}

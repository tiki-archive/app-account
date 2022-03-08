import 'package:flutter/cupertino.dart';
import 'package:user_account/user_account_style.dart';

import 'user_account_service.dart';

class UserAccount {
  final UserAccountService _service;

  UserAccount({UserAccountStyle? style}) :
        _service = UserAccountService(style: style ?? UserAccountStyle());

  open(BuildContext context) {
    _service.presenter.showModal(context);
  }
}

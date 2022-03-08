import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:user_account/user_account_presenter.dart';

import 'model/user_account_model.dart';
import 'user_account_controller.dart';
import 'user_account_style.dart';


class UserAccountService extends ChangeNotifier {
  final Logger _log = Logger('UserAccountService');

  final UserAccountStyle style;
  late final UserAccountPresenter presenter;
  late final UserAccountModel model;
  late final UserAccountController controller;

  UserAccountService({required this.style}) {
    presenter = UserAccountPresenter(this);
    model = UserAccountModel();
    controller = UserAccountController(this);
  }

}

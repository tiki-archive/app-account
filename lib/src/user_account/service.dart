import 'package:flutter/cupertino.dart';
import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';
import 'package:tiki_user_account/src/user_account/presenter.dart';

import 'controller.dart';
import 'model.dart';
import 'model/user_account_model.dart';
import 'user_account_controller.dart';
import 'user_account_presenter.dart';
import 'sign_up/user_account_signup_repository.dart';

class UserAccountService extends ChangeNotifier {
  final Logger _log = Logger('UserAccountService');

  late final UserAccountPresenter presenter;
  late final UserAccountModel model;
  late final UserAccountController controller;
  late final

  final Function logout;
  final HttppClient httppClient;

  UserAccountService(
      {
      required this.logout,
      required this.httppClient,
      required String combinedKeys}) {
    presenter = UserAccountPresenter(this);
    model = UserAccountModel();
    controller = UserAccountController(this);
    model.qrCode = combinedKeys;
  }

  Future<void> showQrCode() async {
    model.showQrCode = true;
    notifyListeners();
  }

  void hideQrCode() {
    model.showQrCode = false;
    notifyListeners();
  }
}

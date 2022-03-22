import 'package:flutter/cupertino.dart';
import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';

import 'model/user_account_model.dart';
import 'user_account_controller.dart';
import 'user_account_presenter.dart';
import 'user_account_signup_repository.dart';
import 'user_account_style.dart';

class UserAccountService extends ChangeNotifier {
  final Logger _log = Logger('UserAccountService');

  final UserAccountStyle style;
  late final UserAccountPresenter presenter;
  late final UserAccountModel model;
  late final UserAccountController controller;

  final Function logout;
  final HttppClient httppClient;

  UserAccountService(
      {required this.style,
      required this.logout,
      required this.httppClient,
      required String referalCode,
      required String combinedKeys}) {
    presenter = UserAccountPresenter(this);
    model = UserAccountModel();
    controller = UserAccountController(this);
    model.code = referalCode;
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

  updateReferCount() async {
    UserAccountSignupRepository.total(model.code, httppClient,
        (total) => model.referCount = total, (error) => _log.warning(error));
  }
}

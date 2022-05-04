import 'package:flutter/cupertino.dart';
import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';

import '../logout/service.dart';
import 'controller.dart';
import 'model.dart';
import 'presenter.dart';

class UserAccountService extends ChangeNotifier {
  final Logger _log = Logger('UserAccountService');

  late final UserAccountPresenter presenter;
  late final UserAccountModel model;
  late final UserAccountController controller;
  late final LogoutService logout;

  final HttppClient httppClient;

  UserAccountService(
      {
      required logoutCallback,
      required this.httppClient,
      required String combinedKeys}) {
    presenter = UserAccountPresenter(this);
    model = UserAccountModel();
    controller = UserAccountController(this);
    logout = LogoutService(logoutCallback);
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

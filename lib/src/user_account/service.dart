import 'package:flutter/cupertino.dart';
import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';

import 'controller.dart';
import 'model.dart';
import 'presenter.dart';

class UserAccountService extends ChangeNotifier {
  final Logger _log = Logger('UserAccountService');

  late final UserAccountPresenter presenter;
  late final UserAccountModel model;
  late final UserAccountController controller;

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

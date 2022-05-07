import 'package:flutter/cupertino.dart';
import 'package:httpp/httpp.dart';
import 'package:sqflite_sqlcipher/sqlite_api.dart';

import '../logout/service.dart';
import '../refer/service.dart';
import 'controller.dart';
import 'model.dart';
import 'presenter.dart';

/// The user account area service.
class UserAccountService extends ChangeNotifier {
  late final UserAccountPresenter presenter;
  late final UserAccountModel model;
  late final UserAccountController controller;
  late final LogoutService logout;
  late final ReferService refer;

  final HttppClient httppClient;

  UserAccountService({
    required Future<void> Function() logoutCallback,
    required Future<void> Function(void Function(String?)? onSuccess)?
        refreshCallback,
    required String combinedKeys,
    required Database database,
    String? Function()? accessToken,
    Httpp? httpp,
  }) : httppClient = httpp == null ? Httpp().client() : httpp.client() {
    presenter = UserAccountPresenter(this);
    model = UserAccountModel();
    controller = UserAccountController(this);
    logout = LogoutService(logoutCallback);
    refer = ReferService(
        refreshCallback: refreshCallback,
        accessToken: accessToken ?? () => null,
        database: database,
        combinedKeys: combinedKeys.split(".").first);
    model.qrCode = combinedKeys;
  }

  /// Shows the QR code in the UI.
  Future<void> showQrCode() async {
    model.showQrCode = true;
    notifyListeners();
  }

  /// Hides the QR code in the UI.
  void hideQrCode() {
    model.showQrCode = false;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'user_account_presenter.dart';

import 'model/user_account_model.dart';
import 'user_account_controller.dart';
import 'user_account_style.dart';

class UserAccountService extends ChangeNotifier {
  final Logger _log = Logger('UserAccountService');

  final UserAccountStyle style;
  late final UserAccountPresenter presenter;
  late final UserAccountModel model;
  late final UserAccountController controller;

  final dynamic login;
  final dynamic referralService;
  final dynamic tikiKeysService;
  final dynamic apiAppDataService;
  final dynamic apiSignupService;

  UserAccountService({
    required this.style,
    required this.login,
    required referalCode,
    required this.referralService,
    required this.tikiKeysService,
    required this.apiAppDataService,
    required this.apiSignupService
  }) {
    presenter = UserAccountPresenter(this);
    model = UserAccountModel();
    controller = UserAccountController(this);
    model.code = referalCode;
  }

  Future<void> updateSignups() async {
    int? total = await referralService.apiSignupService.getTotal();
    if (total != null) {
      model.signupCount = total;
      notifyListeners();
    }
  }

  Future<void> showQrCode() async {
    var keys = await tikiKeysService.get(login.user!.address!);
    if (keys != null) {
      String combinedKey = keys.address +
          '.' +
          keys.data.encode() +
          '.' +
          keys.sign.privateKey.encode();
      model.showQrCode = true;
      model.qrCode = combinedKey;
      notifyListeners();
    }
  }

  void hideQrCode() {
    model.showQrCode = false;
    notifyListeners();
  }

  updateReferCount() async {
    int? count = await apiSignupService.getTotal(code: model.code);
    if (count != null) {
      model.referCount = count;
      notifyListeners();
    }
  }
}

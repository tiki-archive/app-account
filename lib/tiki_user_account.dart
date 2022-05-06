import 'package:flutter/cupertino.dart';
import 'package:httpp/httpp.dart';
import 'package:sqflite_sqlcipher/sqlite_api.dart';

import 'src/user_account/service.dart';

class TikiUserAccount {
  final UserAccountService _service;

  TikiUserAccount({
    Httpp? httpp,
    required Database database,
    required Function logout,
    required Function refresh,
    required String combinedKeys,
    String? accessToken,
  }) : _service = UserAccountService(
            httpp: httpp,
            logoutCallback: logout,
            refreshCallback: refresh,
            combinedKeys: combinedKeys,
            accessToken: accessToken,
            database: database);

  /// Opens the user account bottom sheet.
  open(BuildContext context) {
    _service.presenter.showModal(context);
  }

  /// Gets the code for user referrals.
  String get referCode => _service.refer.referCode;

  /// Gets the user referrals count.
  String get referCount => _service.refer.referCount;
}

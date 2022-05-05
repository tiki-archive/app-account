import 'package:flutter/material.dart';

import 'service.dart';

class LogoutController{

  LogoutService service;
  LogoutController(this.service);

  /// Opens the logout bottom sheet confirmation.
  Future<void> openLogout(BuildContext context) async {
    service.presenter.showModal(context);
  }

  /// Calls the logout callback that was passed to [TikiUserAccount] constructor.
  Future<void> logout(BuildContext context) async{
    service.logout();
  }

}
import 'package:flutter/material.dart';

import 'service.dart';

class LogoutController{

  LogoutService service;
  LogoutController(this.service);

  Future<void> openLogout(BuildContext context) async {
    service.presenter.showModal(context);
  }

  Future<void> logout(BuildContext context) async{
    service.logout();
  }

}
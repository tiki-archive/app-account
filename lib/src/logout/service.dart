import 'package:flutter/cupertino.dart';

import 'controller.dart';
import 'presenter.dart';

/// The service responsible for controlling the logout flow in the user account.
class LogoutService extends ChangeNotifier{
  late final LogoutController controller;
  late final LogoutPresenter presenter;
  final Function logoutCallback;

  /// The service constructor receives a function that will be called on logout.
  LogoutService(this.logoutCallback) {
    controller = LogoutController(this);
    presenter = LogoutPresenter(this);
  }

  /// Executes the logout callback function.
  void logout() {
    logoutCallback();
  }
}
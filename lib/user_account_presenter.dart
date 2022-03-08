import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/user_account_layout.dart';
import 'user_account_service.dart';

class UserAccountPresenter {
  final UserAccountService service;

  UserAccountPresenter(this.service);

  Future<void> showModal(BuildContext context) {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(service.style.size(26)))),
          builder: (BuildContext context) => ChangeNotifierProvider.value(
            value: service, child: const UserAccountLayout()));
  }
}

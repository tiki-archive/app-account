import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../logout/logout_modal_layout.dart';
import '../ui/logout/logout_modal_layout.dart';
import '../ui/user_account_layout.dart';
import '../user_account_service.dart';
import 'service.dart';
import 'ui/layout.dart';


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
                top: Radius.circular(SizeProvider.instance.width(26)))),
          builder: (BuildContext context) => ChangeNotifierProvider.value(
            value: service, child: const UserAccountLayout()));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import 'service.dart';
import 'ui/modal.dart';

class LogoutPresenter {
  final LogoutService service;

  LogoutPresenter(this.service);

  Future<void> showModal(BuildContext context) {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(SizeProvider.instance.width(26)))),
        builder: (BuildContext context) => ChangeNotifierProvider<LogoutService>.value(
            value: service, child: const LogoutUiModal()));
  }
}

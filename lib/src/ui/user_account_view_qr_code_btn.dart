import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../user_account_service.dart';
import '../user_account_style.dart';

class UserAccountViewQrCodeBtn extends StatelessWidget {
  static const String _title = "Show QR Code";
  final UserAccountStyle style;

  const UserAccountViewQrCodeBtn({Key? key, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAccountService service =
        Provider.of<UserAccountService>(context);
    return GestureDetector(
        onTap: () => service.controller.showQrCode(context),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: style.size(1.5*8.12), horizontal: style.size(1.5*8.12)),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("res/images/save-qr-icon.png", package: "user_account", width: style.size(4.5*8.12)),
                  Padding(padding: EdgeInsets.only(right: style.size(2*3.75))),
                  Expanded(
                      child: Text(_title,
                          style: TextStyle(
                              fontSize: style.text(12), fontWeight: FontWeight.bold))),
                  Image.asset("res/images/icon-forward.png", package: "user_account", width: style.size(4.5*8.12))
                ])));
  }
}

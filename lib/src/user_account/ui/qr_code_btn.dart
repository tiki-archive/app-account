import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../service.dart';

class UserAccountUiQrCodeBtn extends StatelessWidget {
  static const String _title = "Show QR Code";

  const UserAccountUiQrCodeBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAccountService service = Provider.of<UserAccountService>(context);
    return GestureDetector(
        onTap: () => service.controller.showQrCode(context),
        child: Container(
            padding: EdgeInsets.only(
                top: SizeProvider.instance.width(18),
                bottom: SizeProvider.instance.width(18),
                left: SizeProvider.instance.width(18),
                right: SizeProvider.instance.width(18)),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(IconProvider.qr_code,
                      color: ColorProvider.tikiBlue,
                      size: SizeProvider.instance.width(24)),
                  Padding(
                      padding: EdgeInsets.only(
                          right: SizeProvider.instance.width(14))),
                  Expanded(
                      child: Text(_title,
                          style: TextStyle(
                              fontFamily: TextProvider.familyNunitoSans,
                              package: 'tiki_style',
                              color: ColorProvider.tikiBlue,
                              fontSize: SizeProvider.instance.text(16),
                              fontWeight: FontWeight.bold))),
                  Icon(IconProvider.arrow_right,
                      color: ColorProvider.tikiBlue,
                      size: SizeProvider.instance.width(16)),
                ])));
  }
}

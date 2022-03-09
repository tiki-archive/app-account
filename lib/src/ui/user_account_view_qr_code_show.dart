import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../user_account_service.dart';
import '../user_account_style.dart';

class UserAccountViewQrCodeShow extends StatelessWidget {

  final UserAccountStyle style;

  const UserAccountViewQrCodeShow({Key? key, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAccountService service =
        Provider.of<UserAccountService>(context);
    return Container(
        padding: EdgeInsets.symmetric(vertical: style.size(1.5*8.12), horizontal: style.size(1.5*8.12)),
        child: QrImage(
          data: service.model.qrCode!,
          version: QrVersions.auto,
          size: style.size(80*3.75),
        ));
  }
}

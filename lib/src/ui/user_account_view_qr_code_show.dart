import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';

import '../user_account_modal_service.dart';

class UserAccountViewQrCodeShow extends StatelessWidget {

  final UserAccountStyle style;

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

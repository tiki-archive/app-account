import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tiki_style/tiki_style.dart';

import '../service.dart';

class UserAccountUiQrCodeShow extends StatelessWidget {

  const UserAccountUiQrCodeShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAccountService service =
        Provider.of<UserAccountService>(context);
    return Container(
        padding: EdgeInsets.symmetric(vertical: SizeProvider.instance.width(1.5*8.12), horizontal: SizeProvider.instance.width(1.5*8.12)),
        child: QrImage(
          data: service.model.qrCode!,
          version: QrVersions.auto,
          size: SizeProvider.instance.width(80*3.75),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:tiki_style/tiki_style.dart';

class UserAccountUiVersion extends StatelessWidget {
  const UserAccountUiVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
          return Text(
              "TIKI Inc." +
                  (snapshot.hasData
                      ? " | Release " + snapshot.data!.version
                      : ""),
              style: TextStyle(
                  fontSize: SizeProvider.instance.text(11),
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF797979)));
        });
  }
}

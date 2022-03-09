import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import '../user_account_style.dart';

class UserAccountViewVersion extends StatelessWidget {
  final UserAccountStyle style;

  const UserAccountViewVersion({Key? key, required this.style}) : super(key: key);
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
                  fontSize: style.text(11),
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF797979)));
        });
  }
}

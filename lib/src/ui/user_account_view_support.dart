import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:style/style.dart';

import '../user_account_service.dart';

class UserAccountViewSupport extends StatelessWidget {
  static const String _title = "Need help?";

  const UserAccountViewSupport({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    UserAccountService service =
        Provider.of<UserAccountService>(context);
    return GestureDetector(
        onTap: () => service.controller.goToSupport(context),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: SizeProvider.instance.width(1.5*8.12), horizontal: SizeProvider.instance.width(1.5*8.12)),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("res/images/helper-icon.png", package: 'user_account', width: SizeProvider.instance.width(4.5*8.12)),
                  Padding(padding: EdgeInsets.only(right: SizeProvider.instance.width(2*3.75))),
                  Expanded(
                      child: Text(_title,
                          style: TextStyle(
                              fontSize: SizeProvider.instance.text(12), fontWeight: FontWeight.bold))),
                  Image.asset("res/images/icon-forward.png", package: "user_account", width: SizeProvider.instance.width(4.5*8.12))
                ])));
  }
}

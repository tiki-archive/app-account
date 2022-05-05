import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../service.dart';

class UserAccountUiSupport extends StatelessWidget {
  static const String _title = "Need help?";

  const UserAccountUiSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAccountService service = Provider.of<UserAccountService>(context);
    return GestureDetector(
        onTap: () => service.controller.goToSupport(context),
        child: Container(
            padding: EdgeInsets.symmetric(
                vertical: SizeProvider.instance.width(18),
                horizontal: SizeProvider.instance.width(16)),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(IconProvider.help_outline,
                      size: SizeProvider.instance.width(24)),
                  Padding(
                      padding: EdgeInsets.only(
                          right: SizeProvider.instance.width(16))),
                  Expanded(
                      child: Text(_title,
                          style: TextStyle(
                              fontSize: SizeProvider.instance.text(12),
                              fontWeight: FontWeight.bold))),
                  Icon(IconProvider.arrow_right,
                      size: SizeProvider.instance.width(16)),
                ])));
  }
}

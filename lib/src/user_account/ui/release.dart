import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import '../../tiki_card/tiki_card.dart';

class UserAccountUiRelease extends StatelessWidget {
  static const String _title = "Coming next";
  static const String _text = "See which companies \nemail you.";
  static const String _cta = "Read more";
  static const String _url = "https://mytiki.com/blog/peek-TIKI-app-prototype";

  const UserAccountUiRelease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: TikiCard(
          const TikiCardUiTitle(_title),
          const TikiCardUiText(_text),
          TikiCardUiFigure(ImgProvider.emailSee),
          cta: TikiCardUiCtaInline(
              Text(_cta,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: TextProvider.familyNunitoSans,
                      fontSize: SizeProvider.instance.text(15),
                      color: ColorProvider.orange)),
              Icon(Icons.arrow_forward, color: ColorProvider.orange, size: SizeProvider.instance.text(24)),
              () => TikiCardController.openUrl(_url)),
        ),
        onTap: () => TikiCardController.openUrl(_url));
  }
}

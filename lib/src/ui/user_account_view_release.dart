import 'package:flutter/material.dart';
import 'package:style/style.dart';


import 'widgets/tiki_card/tiki_card.dart';
import 'widgets/tiki_card/tiki_card_controller.dart';
import 'widgets/tiki_card/tiki_card_view_cta_inline.dart';
import 'widgets/tiki_card/tiki_card_view_figure.dart';
import 'widgets/tiki_card/tiki_card_view_text.dart';
import 'widgets/tiki_card/tiki_card_view_title.dart';

class UserAccountViewRelease extends StatelessWidget {

  static const String _title = "Coming next";
  static const String _text = "See which companies \nemail you";
  static const String _cta = "Read More";
  static const String _url = "https://mytiki.com/blog/peek-TIKI-app-prototype";

  const UserAccountViewRelease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: TikiCard(
          const TikiCardViewTitle(_title),
          const TikiCardViewText(_text),
          TikiCardViewFigure(Image.asset("res/images/email-see.png", package: "user_account")),
          cta: TikiCardViewCtaInline(
              Text(_cta,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeProvider.instance.text(12.5),
                      color: const Color(0xFFFF521C))),
              const Icon(Icons.arrow_forward, color: Color(0xFFFF521C)),
              () => TikiCardController.launchUrl(_url)),
        ),
        onTap: () => TikiCardController.launchUrl(_url));
  }
}

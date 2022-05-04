import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';


import 'widgets/tiki_card/tiki_card.dart';
import 'widgets/tiki_card/tiki_card_controller.dart';
import 'widgets/tiki_card/tiki_card_view_cta_inline.dart';
import 'widgets/tiki_card/tiki_card_view_figure.dart';
import 'widgets/tiki_card/tiki_card_view_text.dart';
import 'widgets/tiki_card/tiki_card_view_title.dart';

class UserAccountViewNews extends StatelessWidget {
  static const String _title = "Latest news";
  static const String _text =
      "For the latest news and updates, check out our blog.";
  static const String _cta = "Read More";
  static const String _url = "https://mytiki.com/blog";


  const UserAccountViewNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: TikiCard(
          const TikiCardViewTitle(_title),
          const TikiCardViewText(_text),
          TikiCardViewFigure(ImgProvider.tikiNews),
          cta: TikiCardViewCtaInline(
              Text(_cta,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeProvider.instance.text(12.5),
                      color: const Color(0xFFFF521C))),
              Icon(Icons.arrow_forward,
                  color: const Color(0xFFFF521C), size: SizeProvider.instance.text(12.5)),
              () => TikiCardController.launchUrl(_url)),
        ),
        onTap: () => TikiCardController.launchUrl(_url));
  }
}

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import '../../tiki_card/tiki_card.dart';

class UserAccountUiNews extends StatelessWidget {
  static const String _title = "Latest news";
  static const String _text =
      "For the latest news and updates, check out our blog.";
  static const String _cta = "Read more";
  static const String _url = "https://mytiki.com/blog";

  const UserAccountUiNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: TikiCard(
          const TikiCardUiTitle(_title),
          const TikiCardUiText(_text),
          TikiCardUiFigure(ImgProvider.tikiNews),
          cta: TikiCardUiCtaInline(
              Text(_cta,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeProvider.instance.text(15),
                      color: ColorProvider.orange)),
              Icon(Icons.arrow_forward,
                  color: ColorProvider.orange,
                  size: SizeProvider.instance.text(24)),
              () => TikiCardController.launchUrl(_url)),
        ),
        onTap: () => TikiCardController.launchUrl(_url));
  }
}

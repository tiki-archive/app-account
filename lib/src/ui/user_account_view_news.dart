import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../config/config_color.dart';
import '../../../utils/helper_image.dart';
import '../../../widgets/tiki_card/tiki_card.dart';
import '../../../widgets/tiki_card/tiki_card_controller.dart';
import '../../../widgets/tiki_card/tiki_card_view_cta_inline.dart';
import '../../../widgets/tiki_card/tiki_card_view_figure.dart';
import '../../../widgets/tiki_card/tiki_card_view_text.dart';
import '../../../widgets/tiki_card/tiki_card_view_title.dart';

class UserAccountViewNews extends StatelessWidget {
  static const String _title = "Latest news";
  static const String _text =
      "For the latest news and updates, check out our blog.";
  static const String _cta = "Read More";
  static const String _url = "https://mytiki.com/blog";
  final UserAccountStyle style;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: TikiCard(
          TikiCardViewTitle(_title),
          TikiCardViewText(_text),
          TikiCardViewFigure(Image.asset("res/images/tiki-news.png", package: "user_account")),
          cta: TikiCardViewCtaInline(
              Text(_cta,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.5.sp,
                      color: Color(0xFFFF521C))),
              Icon(Icons.arrow_forward,
                  color: Color(0xFFFF521C), size: 12.5.sp),
              () => TikiCardController.launchUrl(_url)),
        ),
        onTap: () => TikiCardController.launchUrl(_url));
  }
}

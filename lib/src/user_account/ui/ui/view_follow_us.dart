import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';


import 'widgets/tiki_card/tiki_card.dart';
import 'widgets/tiki_card/tiki_card_controller.dart';
import 'widgets/tiki_card/tiki_card_view_cta_grid.dart';
import 'widgets/tiki_card/tiki_card_view_figure.dart';
import 'widgets/tiki_card/tiki_card_view_text.dart';
import 'widgets/tiki_card/tiki_card_view_title.dart';

class UserAccountViewFollowUs extends StatelessWidget {
  static const num _btnPaddingHorizontal = 2;
  static const num _btnPaddingVertical = 0.75;
  static const num _btnHeight = 6;
  static const String _title = "Follow us";
  static const String _text =
      "You can find helpful and fun stuff on our channels.";
  static const String _facebookUrl = "https://www.facebook.com/mytikiapp";
  static const String _twitterUrl = "https://twitter.com/my_tiki_";
  static const String _instagramUrl = "https://www.instagram.com/my.tiki/";
  static const String _tiktokUrl = "https://www.tiktok.com/@my.tiki";


  const UserAccountViewFollowUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TikiCard(
      const TikiCardViewTitle(_title),
      const TikiCardViewText(_text),
      TikiCardViewFigure(ImgProvider.tikiPool),
      cta: TikiCardViewCtaGrid([
        Expanded(
            child: GestureDetector(
                onTap: () => TikiCardController.launchUrl(_facebookUrl),
                child: Container(
                    padding: EdgeInsets.only(
                        left: SizeProvider.instance.width(3 * _btnPaddingHorizontal*3.75),
                        top: SizeProvider.instance.width(3 * _btnPaddingVertical*8.12),
                        right: SizeProvider.instance.width(_btnPaddingHorizontal*3.75),
                        bottom: SizeProvider.instance.width(_btnPaddingVertical*8.12)),
                    child:
                        SizedBox(child: ImgProvider.facebookButton, height: SizeProvider.instance.width(_btnHeight*8.12))))),
        Expanded(
            child: GestureDetector(
                onTap: () => TikiCardController.launchUrl(_twitterUrl),
                child: Container(
                    padding: EdgeInsets.only(
                        left: SizeProvider.instance.width(_btnPaddingHorizontal*3.75),
                        top: SizeProvider.instance.width(3 * _btnPaddingVertical*8.12),
                        right: SizeProvider.instance.width(3 * _btnPaddingHorizontal*3.75),
                        bottom: SizeProvider.instance.width(_btnPaddingVertical*8.12)),
                    child:
                        SizedBox(child:ImgProvider.twitterButton, height: SizeProvider.instance.width(_btnHeight*8.12))))),
        Expanded(
            child: GestureDetector(
                onTap: () => TikiCardController.launchUrl(_instagramUrl),
                child: Container(
                    padding: EdgeInsets.only(
                        left: SizeProvider.instance.width(3 * _btnPaddingHorizontal*3.75),
                        top: SizeProvider.instance.width(_btnPaddingVertical*8.12),
                        right: SizeProvider.instance.width(_btnPaddingHorizontal*3.75),
                        bottom: SizeProvider.instance.width(4 * _btnPaddingVertical*8.12)),
                    child: SizedBox(child: ImgProvider.instagramButton,
                        height: SizeProvider.instance.width(_btnHeight*8.12))))),
        Expanded(
            child: GestureDetector(
                onTap: () => TikiCardController.launchUrl(_tiktokUrl),
                child: Container(
                    padding: EdgeInsets.only(
                        left: SizeProvider.instance.width(_btnPaddingHorizontal*3.75),
                        top: SizeProvider.instance.width(_btnPaddingVertical*8.12),
                        right: SizeProvider.instance.width(3 * _btnPaddingHorizontal*3.75),
                        bottom: SizeProvider.instance.width(4 * _btnPaddingVertical*8.12)),
                    child:
                    SizedBox(child: ImgProvider.tiktokButton,
                        height: SizeProvider.instance.width(_btnHeight*8.12)))))
      ]),
    );
  }
}

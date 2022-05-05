import 'package:flutter/material.dart';

import 'cta.dart';
import 'cta_inline.dart';
import 'figure.dart';
import 'text.dart';
import 'title.dart';

class TikiCard extends StatelessWidget {
  final TikiCardUiTitle title;
  final TikiCardUiText text;
  final TikiCardUiFigure figure;
  final TikiCardUiCta? cta;
  final Color bgColor;

  const TikiCard(this.title, this.text, this.figure,
      {Key? key, this.cta, this.bgColor = const Color(0xFFF0F0F0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: getPadding(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding: getColumnPadding(),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                            flex: 2,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  title,
                                  Container(
                                      margin: const EdgeInsets.only(top: 6),
                                      child: text),
                                ])),
                        Flexible(
                          flex: 1,
                          child: figure,
                        )
                      ])),
              cta ?? Container()
            ]));
  }

  getPadding() {
    if (cta == null || cta is TikiCardUiCtaInline) {
      return const EdgeInsets.only(top: 16, left: 18, right: 18, bottom: 8);
    }
    return const EdgeInsets.only(top: 24, left: 0, right: 0, bottom: 0);
  }

  getColumnPadding() {
    if (cta == null || cta is TikiCardUiCtaInline) {
      return const EdgeInsets.all(0);
    }
    return const EdgeInsets.symmetric(horizontal: 20);
  }
}

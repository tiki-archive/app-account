import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'refer_box.dart';
import 'refer_share.dart';

class ReferUiBox extends StatelessWidget {
  const ReferUiBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(
                      top: SizeProvider.instance.width(3.5 * 8.12)),
                  child: const Refer()),
              Container(
                  width: SizeProvider.instance.width(220),
                  padding: EdgeInsets.only(
                    top: SizeProvider.instance.height(37),
                    bottom: SizeProvider.instance.height(44)
                  ),
                  child: const ReferUiShare()),
            ]));
  }
}

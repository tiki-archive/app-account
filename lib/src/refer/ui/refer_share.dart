/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../controller.dart';
import '../service.dart';

class ReferUiShare extends StatelessWidget {
  static const String _text = "SHARE";

  const ReferUiShare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReferService service = Provider.of<ReferService>(context);
    ReferController controller = service.controller;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding:
                EdgeInsets.symmetric(vertical: SizeProvider.instance.height(12)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeProvider.instance.width(80)))),
            primary: const Color(0xFF27002E)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding:
                    EdgeInsets.only(right: SizeProvider.instance.width(18)),
                child: Text(_text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: TextProvider.familyNunitoSans,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeProvider.instance.text(20),
                      letterSpacing: SizeProvider.instance.width(1),
                    ))),
            Icon(
              Icons.share,
              size: SizeProvider.instance.text(22),
            ),
          ],
        ),
        onPressed: () => controller.onShare());
  }
}

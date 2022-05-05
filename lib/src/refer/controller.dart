import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import 'service.dart';

class ReferController {
  static const String _linkUrl = "https://mytiki.com/";
  static const String _shareBody =
      "Your data. Your decisions. Take the take power back from corporations. Together, we triumph. Join us! ";
  static const String _shareLink = "https://mytiki.com/";
  static const String _shareSubject = "Have you seen this???";

  final ReferService service;

  ReferController(this.service);

  /// Calls the OS share functionality to share the refer code.
  Future<void> onShare() async {
    if (service.referCode.isNotEmpty) {
      Share.share(_shareBody + _shareLink + service.referCode,
          subject: _shareSubject);
    }
  }

  /// Copy the share link to clipboard.
  Future<void> copyLink(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: _linkUrl + service.referCode));
  }
}

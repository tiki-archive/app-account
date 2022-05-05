/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:url_launcher/url_launcher_string.dart';

class TikiCardController {
  /// Launchs an URL with the OS native action.
  static launchUrl(String url) async {
    await canLaunchUrlString(url)
        ? await launchUrl(url)
        : throw 'Could not launch $url';
  }
}

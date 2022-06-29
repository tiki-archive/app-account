/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TikiCardController {
  /// Launchs an URL with the OS native action.
  static openUrl(String url) async {
    await canLaunchUrlString(url)
        ? await launchUrl(Uri.parse(url))
        : throw 'Could not launch $url';
  }
}

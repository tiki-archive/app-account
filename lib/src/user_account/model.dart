/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class UserAccountModel {
  int? signupCount;

  bool logoutModalActive = false;

  bool showQrCode = false;

  String? qrCode = "sample QR code";

  String referCode = "";

  int referCount = 0;
}

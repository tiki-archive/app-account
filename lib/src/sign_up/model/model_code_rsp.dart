/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class SignUpModelCodeRsp {
  String? code;

  SignUpModelCodeRsp({this.code});

  SignUpModelCodeRsp.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      code = json['code'];
    }
  }

  Map<String, dynamic> toJson() => {'code': code};
}

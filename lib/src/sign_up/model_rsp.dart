/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class ApiShortCodeModelRsp {
  String? code;

  ApiShortCodeModelRsp({this.code});

  ApiShortCodeModelRsp.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      code = json['code'];
    }
  }

  Map<String, dynamic> toJson() => {'code': code};
}

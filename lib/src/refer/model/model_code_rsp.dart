/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class ReferModelCodeRsp {
  String? code;

  ReferModelCodeRsp({this.code});

  ReferModelCodeRsp.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      code = json['code'];
    }
  }

  Map<String, dynamic> toJson() => {'code': code};
}

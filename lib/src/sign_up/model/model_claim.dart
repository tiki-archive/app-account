/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class SignUpModelClaim {
  String? code;
  String? address;

  SignUpModelClaim({this.code, this.address});

  SignUpModelClaim.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      code = json['code'];
      address = json['address'];
    }
  }

  Map<String, dynamic> toJson() => {'address': address, 'code': code};
}

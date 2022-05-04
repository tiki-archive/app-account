/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class ApiShortCodeModelClaim {
  String? code;
  String? address;

  ApiShortCodeModelClaim({this.code, this.address});

  ApiShortCodeModelClaim.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      code = json['code'];
      address = json['address'];
    }
  }

  Map<String, dynamic> toJson() => {'address': address, 'code': code};
}

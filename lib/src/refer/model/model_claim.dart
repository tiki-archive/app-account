/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class ReferModelClaim {
  String? code;
  String? address;

  ReferModelClaim({this.code, this.address});

  ReferModelClaim.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      code = json['code'];
      address = json['address'];
    }
  }

  Map<String, dynamic> toJson() => {'address': address, 'code': code};
}

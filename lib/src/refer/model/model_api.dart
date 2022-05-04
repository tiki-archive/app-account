/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class ReferModelApi<T> {
  String? status;
  int? code;
  dynamic data;

  ReferModelApi({this.status, this.code, this.data});

  ReferModelApi.fromJson(Map<String, dynamic>? json,
      T Function(Map<String, dynamic>? json) fromJson) {
    if (json != null) {
      status = json['status'];
      code = json['code'];

      if (json['data'] != null) {
        data = json['data'] is List
            ? json['data'].map((e) => fromJson(e)).toList()
            : fromJson(json['data']);
      }
    }
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'data': data?.toJson(),
      };
}

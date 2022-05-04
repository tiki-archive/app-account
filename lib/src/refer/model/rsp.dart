/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'rsp_message.dart';
import 'rsp_page.dart';

class ReferModelRsp<T> {
  String? status;
  int? code;
  dynamic data;
  ReferModelRspPage? page;
  late List<ReferModelRspMessage> messages;

  ReferModelRsp(
      {this.status, this.code, this.data, this.page, this.messages = const []});

  ReferModelRsp.fromJson(Map<String, dynamic>? json,
      T Function(Map<String, dynamic>? json) fromJson) {
    if (json != null) {
      status = json['status'];
      code = json['code'];

      if (json['data'] != null) {
        data = json['data'] is List
            ? json['data'].map((e) => fromJson(e)).toList()
            : fromJson(json['data']);
      }

      if (json['page'] != null) {
        page = ReferModelRspPage().fromJson(json['page']);
      }

      if (json['messages'] != null) {
        messages = (json['messages'] as List)
            .map((e) => ReferModelRspMessage.fromJson(e))
            .toList();
      }
    }
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'data': data?.toJson(),
        'page': page?.toJson(),
        'messages': messages.map((e) => e.toJson()).toList()
      };
}

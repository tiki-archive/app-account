/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'model_rsp_message.dart';
import 'model_rsp_page.dart';

class SignUpModelRsp<T> {
  String? status;
  int? code;
  dynamic data;
  SignUpModelRspPage? page;
  late List<SignUpModelRspMessage> messages;

  SignUpModelRsp(
      {this.status, this.code, this.data, this.page, this.messages = const []});

  SignUpModelRsp.fromJson(Map<String, dynamic>? json,
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
        page = SignUpModelRspPage().fromJson(json['page']);
      }

      if (json['messages'] != null) {
        messages = (json['messages'] as List)
            .map((e) => SignUpModelRspMessage.fromJson(e))
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

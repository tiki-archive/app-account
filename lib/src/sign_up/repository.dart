/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';

import 'model/model_claim.dart';
import 'model/model_rsp.dart';

class UserAccountSignupRepository {
  final Logger _log = Logger('ApiShortCodeRepository');
  static const String _authority = 'bouncer.mytiki.com';
  static const String _shortCodePath = '/api/latest/short-code';
  static const String _userPath = '/api/0-1-0/user';
  static const String _domain = 'signup.mytiki.com';

  Future<void> post(
      {required HttppClient client,
      String? accessToken,
      SignUpModelClaim? body,
      void Function(SignUpModelRsp)? onSuccess,
      void Function(Object)? onError}) async {
    HttppRequest request = HttppRequest(
        uri: Uri.https(_authority, _path),
        verb: HttppVerb.POST,
        body: HttppBody.fromJson(body?.toJson()),
        headers: HttppHeaders.typical(bearerToken: accessToken),
        timeout: const Duration(seconds: 30),
        onSuccess: (rsp) {
          if (onSuccess != null) {
            onSuccess(SignUpModelRsp.fromJson(rsp.body?.jsonBody,
                (json) => ApiShortCodeModelRsp.fromJson(json)));
          }
        },
        onResult: (rsp) {
          if (onError != null) {
            onError(TikiApiModelRsp.fromJson(rsp.body?.jsonBody, (json) {}));
          }
        },
        onError: onError);
    _log.finest('${request.verb.value} — ${request.uri}');
    return client.request(request);
  }

  Future<void> get(
      {required HttppClient client,
      String? accessToken,
      required String address,
      void Function(TikiApiModelRsp<ApiShortCodeModelRsp>)? onSuccess,
      void Function(Object)? onError}) async {
    HttppRequest request = HttppRequest(
        uri: Uri.https(_authority, _path, {'address': address}),
        verb: HttppVerb.GET,
        headers: HttppHeaders.typical(bearerToken: accessToken),
        timeout: const Duration(seconds: 30),
        onSuccess: (rsp) {
          if (onSuccess != null) {
            onSuccess(TikiApiModelRsp.fromJson(rsp.body?.jsonBody,
                (json) => ApiShortCodeModelRsp.fromJson(json)));
          }
        },
        onResult: (rsp) {
          if (onError != null) {
            onError(TikiApiModelRsp.fromJson(rsp.body?.jsonBody, (json) {}));
          }
        },
        onError: onError);
    _log.finest('${request.verb.value} — ${request.uri}');
    return client.request(request);
  }

  Future<void> total(String code, HttppClient httppClient,
      Function? onSuccess, Function? onError) async {
    var query = {"referrer": code};
    HttppRequest request = HttppRequest(
        uri: Uri.https(_domain, _path, query),
        verb: HttppVerb.GET,
        headers: HttppHeaders.typical(),
        timeout: const Duration(seconds: 30),
        onSuccess: (rsp) {
          if (rsp.statusCode == 200) {
            UserAccountSignUpModel apiRsp =
            UserAccountSignUpModel.fromJson(rsp.body?.jsonBody);
            int? total = apiRsp.total;
            onSuccess != null && total != null ? onSuccess(total) : null;
          }
        },
        onError: (error) async =>
        onError != null ? onError(error) : throw error);
    httppClient.request(request);
  }
}

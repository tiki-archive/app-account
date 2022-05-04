/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';

import 'model/model_api.dart';
import 'model/model_claim.dart';
import 'model/model_code_rsp.dart';
import 'model/model_rsp.dart';
import 'model/model_total_rsp.dart';

class ReferRepository {
  final Logger _log = Logger('ApiShortCodeRepository');
  static const String _authority = 'bouncer.mytiki.com';
  static const String _shortCodePath = '/api/latest/short-code';
  static const String _userPath = '/api/0-1-0/user';
  static const String _domain = 'signup.mytiki.com';

  final HttppClient _client;

  var refresh;

  ReferRepository(client) :
      _client = client;

  Future<void> getCode(
      {required String accessToken,
        required String address,
        Function(Object)? onError,
        Function(ReferModelCodeRsp)? onSuccess}) async =>
      _auth(
          accessToken,
          onError,
              (token, onError) => _get(
              client: _client,
              accessToken: token,
              address: address,
              onSuccess: (rsp) {
                if (onSuccess != null) {
                  onSuccess(rsp.data as ReferModelCodeRsp);
                }
              },
              onError: onError));

  Future<void> claimCode(
      {required String accessToken,
        required ReferModelClaim claim,
        Function(Object)? onError,
        Function(ReferModelRsp)? onSuccess}) async =>
      _auth(
          accessToken,
          onError,
              (token, onError) => _post(
              client: _client,
              accessToken: token,
              body: claim,
              onSuccess: (rsp) {
                if (onSuccess != null) {
                  onSuccess(rsp.data as ReferModelRsp);
                }
              },
              onError: onError));

  Future<void> getTotal(String code, HttppClient httppClient,
      Function? onSuccess, Function? onError) async {
    var query = {"referrer": code};
    HttppRequest request = HttppRequest(
        uri: Uri.https(_domain, _userPath, query),
        verb: HttppVerb.GET,
        headers: HttppHeaders.typical(),
        timeout: const Duration(seconds: 30),
        onSuccess: (rsp) {
          if (rsp.statusCode == 200) {
            ReferModelTotalRsp apiRsp =
              ReferModelTotalRsp.fromJson(rsp.body?.jsonBody);
            int? total = apiRsp.total;
            onSuccess != null && total != null ? onSuccess(total) : null;
          }
        },
        onError: (error) async =>
        onError != null ? onError(error) : throw error);
    httppClient.request(request);
  }

  Future<void> _post(
      {required HttppClient client,
      String? accessToken,
      ReferModelClaim? body,
      void Function(ReferModelRsp)? onSuccess,
      void Function(Object)? onError}) async {
    HttppRequest request = HttppRequest(
        uri: Uri.https(_authority, _shortCodePath),
        verb: HttppVerb.POST,
        body: HttppBody.fromJson(body?.toJson()),
        headers: HttppHeaders.typical(bearerToken: accessToken),
        timeout: const Duration(seconds: 30),
        onSuccess: (rsp) {
          if (onSuccess != null) {
            onSuccess(ReferModelRsp.fromJson(rsp.body?.jsonBody,
                (json) => ReferModelCodeRsp.fromJson(json)));
          }
        },
        onResult: (rsp) {
          if (onError != null) {
            onError(ReferModelRsp.fromJson(rsp.body?.jsonBody, (json) {}));
          }
        },
        onError: onError);
    _log.finest('${request.verb.value} — ${request.uri}');
    return client.request(request);
  }

  Future<void> _get(
      {required HttppClient client,
      String? accessToken,
      required String address,
      void Function(ReferModelRsp<ReferModelCodeRsp>)? onSuccess,
      void Function(Object)? onError}) async {
    HttppRequest request = HttppRequest(
        uri: Uri.https(_authority, _shortCodePath, {'address': address}),
        verb: HttppVerb.GET,
        headers: HttppHeaders.typical(bearerToken: accessToken),
        timeout: const Duration(seconds: 30),
        onSuccess: (rsp) {
          if (onSuccess != null) {
            onSuccess(ReferModelRsp.fromJson(rsp.body?.jsonBody,
                (json) => ReferModelCodeRsp.fromJson(json)));
          }
        },
        onResult: (rsp) {
          if (onError != null) {
            onError(ReferModelRsp.fromJson(rsp.body?.jsonBody, (json) {}));
          }
        },
        onError: onError);
    _log.finest('${request.verb.value} — ${request.uri}');
    return client.request(request);
  }

  Future<T> _auth<T>(String accessToken, Function(Object)? onError,
      Future<T> Function(String, Future<void> Function(Object)) request) async {
    return request(accessToken, (error) async {
      if (error is ReferModelCodeRsp && error.code == '401' && refresh != null) {
        await refresh!((token) async {
          if (token != null) {
            await request(
                token,
                    (error) async =>
                onError != null ? onError(error) : throw error);
          }
        });
      } else {
        onError != null ? onError(error) : throw error;
      }
    });
  }
}

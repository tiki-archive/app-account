/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:httpp/httpp.dart';

import 'model/model.dart';
import 'model/model_claim.dart';
import 'model/model_code_rsp.dart';
import 'model/model_rsp.dart';
import 'repository.dart';

class SignUpService {
  final HttppClient _client;
  final Future<void> Function(void Function(String?)? onSuccess)? refresh;
  final UserAccountSignupRepository _repository;
  final SignUpModel _model;

  SignUpService({Httpp? httpp, this.refresh})
      : _client = httpp?.client() ?? Httpp().client(),
        _model = SignUpModel(),
        _repository = UserAccountSignupRepository();

  Future<void> get(
          {required String accessToken,
          required String address,
          Function(Object)? onError,
          Function(SignUpModelCodeRsp)? onSuccess}) async =>
      _auth(
          accessToken,
          onError,
          (token, onError) => _repository.get(
              client: _client,
              accessToken: token,
              address: address,
              onSuccess: (rsp) {
                if (onSuccess != null) {
                  onSuccess(rsp.data as SignUpModelCodeRsp);
                }
              },
              onError: onError));

  Future<void> claim(
          {required String accessToken,
          required SignUpModelClaim claim,
          Function(Object)? onError,
          Function(SignUpModelRsp)? onSuccess}) async =>
      _auth(
          accessToken,
          onError,
          (token, onError) => _repository.post(
              client: _client,
              accessToken: token,
              body: claim,
              onSuccess: (rsp) {
                if (onSuccess != null) {
                  onSuccess(rsp.data as SignUpModelRsp);
                }
              },
              onError: onError));

  Future<T> _auth<T>(String accessToken, Function(Object)? onError,
      Future<T> Function(String, Future<void> Function(Object)) request) async {
    return request(accessToken, (error) async {
      if (error is SignUpModelCodeRsp && error.code == '401' && refresh != null) {
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

  updateReferCount() async {
    if(_model.referCode == null){
      await getReferCode();
    }
    _repository.total(_model.referCode!, _client, (total) {
      _model.referCount = total;
      notifyListeners();
    }, (error) => _log.warning(error));
  }

  getReferCode() {}


  Future<void> get(
      {required String accessToken,
        required String address,
        Function(Object)? onError,
        Function(SignUpModelCodeRsp)? onSuccess}) async =>
      _auth(
          accessToken,
          onError,
              (token, onError) => _repository.get(
              client: _client,
              accessToken: token,
              address: address,
              onSuccess: (rsp) {
                if (onSuccess != null) {
                  onSuccess(rsp.data as SignUpModelCodeRsp);
                }
              },
              onError: onError));

  Future<void> claim(
      {required String accessToken,
        required SignUpModelClaim claim,
        Function(Object)? onError,
        Function(SignUpModelCodeRsp)? onSuccess}) async =>
      _auth(
          accessToken,
          onError,
              (token, onError) => _repository.post(
              client: _client,
              accessToken: token,
              body: claim,
              onSuccess: (rsp) {
                if (onSuccess != null) {
                  onSuccess(rsp.data as SignUpModelCodeRsp);
                }
              },
              onError: onError));

  Future<T> _auth<T>(String accessToken, Function(Object)? onError,
      Future<T> Function(String, Future<void> Function(Object)) request) async {
    return request(accessToken, (error) async {
      if (error is TikiApiModelRsp && error.code == 401 && refresh != null) {
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

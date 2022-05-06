/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';
import 'package:sqflite_sqlcipher/sqlite_api.dart';

import 'controller.dart';
import 'model/claim.dart';
import 'model/model.dart';
import 'presenter.dart';
import 'repository.dart';

class ReferService extends ChangeNotifier {
  static const String _prefix = 'com.mytiki.app';
  static const String _versionPrefix = '0.0.1';
  static const String _currentPrefix =
      _prefix + '.' + 'current' + '.' + _versionPrefix + '.user';

  //static const String _userPrefix = _prefix + '.' + 'user' + '.' + _versionPrefix + '.';
  static const String _keysPrefix =
      _prefix + '.' + 'keys' + '.' + _versionPrefix + '.';

  final Logger _log = Logger('ReferService');

  final ReferRepository _repository;
  final ReferModel _model;
  final Database _database;

  late final ReferController controller;
  late final ReferPresenter presenter;

  /// The [ReferService] main constructor.
  ReferService(
      {Httpp? httpp,
      String? accessToken,
      required String combinedKeys,
      required Function refreshCallback,
      required Database database})
      : _model = ReferModel(combinedKeys.split(".").first),
        _repository = ReferRepository(
            httpp?.client() ?? Httpp().client(), refreshCallback),
        _database = database {
    controller = ReferController(this);
    presenter = ReferPresenter(this);
    _updateReferCount(accessToken: accessToken);
  }

  /// Initializes the variables for [ReferService].
  ///
  /// This method is just used if one needs to await the initilization of the
  /// variables. In any other scenario, the default main constructor is enough.
  Future<ReferService> init({String? accessToken}) async {
    await _updateReferCount(accessToken: accessToken);
    return this;
  }

  /// The code to be used in referrals.
  ///
  /// If the code was not loaded yet, it returns an empty String and calls
  /// [_getReferCode] to update the code asynchronously. After the update,
  /// [notifyListeners] is called to rebuild the UI with updated code.
  String get referCode => _model.referCode ?? _getReferCode();

  /// The referrals count.
  ///
  /// If the code was not loaded yet, it returns an empty String and calls
  /// [_getReferCount] to update the count asynchronously. After the update,
  /// [notifyListeners] is called to rebuild the UI with updated count.
  String get referCount => _model.referCount ?? _getReferCount();

  Future<void> _upgrade({String? accessToken}) async {
    Logger log = Logger('upgrade');
    String? code = await _getCodeFromDatabase();
    if (code == null) return;
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    await _repository.claimCode(
        accessToken: accessToken,
        claim: ReferModelClaim(code: code, address: _model.address),
        onSuccess: (rsp) async {
          await secureStorage.delete(key: _currentPrefix);
          //await secureStorage.delete(key: _userPrefix + email);
          await secureStorage.delete(key: _keysPrefix + _model.address);
        },
        onError: (error) => log.warning(error));
  }

  Future<String?> _getCodeFromDatabase() async {
    List<Map<String, Object?>> rows = await _database
        .query('app_data', where: "key = ?", whereArgs: ['user_refer_code']);
    if (rows.isNotEmpty) return rows[0]['value'] as String;
    return null;
  }

  String _getReferCount({String? accessToken}) {
    _updateReferCount(accessToken: accessToken);
    return '';
  }

  String _getReferCode({String? accessToken}) {
    _repository.getCode(
        accessToken: accessToken,
        address: _model.address,
        onSuccess: (rsp) => _model.referCode = rsp.code,
        onError: (error) => _log.warning(error));
    return '';
  }

  Future<void> _updateReferCount({String? accessToken}) async {
    if (_model.referCode == null) {
      await _upgrade();
      await _repository.getCode(
          accessToken: accessToken,
          address: _model.address,
          onSuccess: (rsp) => _model.referCode = rsp.code,
          onError: (error) => _log.warning(error));
    }
    _repository.getTotal(
        code: referCode,
        onSuccess: (total) {
          _model.referCount = total;
          notifyListeners();
        },
        onError: (error) => _log.warning(error));
  }
}

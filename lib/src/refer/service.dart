/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/cupertino.dart';
import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';

import 'controller.dart';
import 'model/model.dart';
import 'presenter.dart';
import 'repository.dart';

class ReferService extends ChangeNotifier {
  final Logger _log = Logger('ReferService');

  final ReferRepository _repository;
  final ReferModel _model;
  late final ReferController controller;
  late final ReferPresenter presenter;

  /// The [ReferService] main constructor.
  ReferService({Httpp? httpp, required String accessToken, required String address})
      : _model = ReferModel(accessToken, address),
        _repository = ReferRepository(httpp?.client() ?? Httpp().client()){
    controller = ReferController(this);
    presenter = ReferPresenter(this);
    _updateReferCount();
  }

  /// Initializes the variables for [ReferService].
  ///
  /// This method is just used if one needs to await the initilization of the
  /// variables. In any other scenario, the default main constructor is enough.
  Future<ReferService> init() async{
    await _updateReferCount();
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

  String _getReferCount(){
    _updateReferCount();
    return '';
  }

  String _getReferCode() {
    _repository.getCode(
        accessToken: _model.accessToken,
        address: _model.address,
        onSuccess: (rsp) => _model.referCode = rsp.code,
        onError: (error) => _log.warning(error));
    return '';
  }

  Future<void> _updateReferCount() async {
    if(_model.referCode == null){
      await _repository.getCode(
          accessToken: _model.accessToken,
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

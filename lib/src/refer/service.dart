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
  final ReferController controller;
  late final ReferPresenter presenter;

  ReferService({Httpp? httpp, required String accessToken, required String address})
      : _model = ReferModel(accessToken, address),
        _repository = ReferRepository(httpp?.client() ?? Httpp().client()),
        controller = ReferController() {
    presenter = ReferPresenter(this);
  }

  String get referCode => _model.referCode ?? _getReferCode();

  String get referCount => _model.referCount ?? _getReferCount();

  String _getReferCount(){
    _updateReferCount();
    return '';
  }

  String _getReferCode() {
    _repository.getCode(
        accessToken: _model.accessToken, address: _model.address);
    return '';
  }

  Future<void> _updateReferCount() async {
    if(_model.referCode == null){
      await  _repository.getCode(accessToken: _model.accessToken, address: _model.address);
    }
    _repository.getTotal(_model.referCode!, (total) {
      _model.referCount = total;
      notifyListeners();
    }, (error) => _log.warning(error));
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/cupertino.dart';
import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';

import 'controller.dart';
import 'model/model.dart';
import 'model/model_claim.dart';
import 'model/model_code_rsp.dart';
import 'model/model_rsp.dart';
import 'repository.dart';

class ReferService extends ChangeNotifier {
  final Logger _log = Logger('ReferService');
  
  final HttppClient _client;
  final Future<void> Function(void Function(String?)? onSuccess)? refresh;
  final ReferRepository _repository;
  final ReferModel _model;
  final ReferController controller;

  ReferService({Httpp? httpp, this.refresh})
      : _client = httpp?.client() ?? Httpp().client(),
        _model = ReferModel(),
        controller = ReferController(),
        _repository = ReferRepository();

  String get referCode => _model.referCode ?? _getReferCode();

  String get referCount => _model.referCount ?? _getReferCount();

  String _getReferCount(){
    _updateReferCount();
    return '';
  }

  String _getReferCode() {
    _repository.getCode(
        accessToken: accessToken, address: address,
    return '';
  }

  Future<void> _updateReferCount() async {
    if(_model.referCode == null){
      await  _repository.getCode(accessToken: accessToken, address: address);
    }
    _repository.total(_model.referCode!, _client, (total) {
      _model.referCount = total;
      notifyListeners();
    }, (error) => _log.warning(error));
  }
}

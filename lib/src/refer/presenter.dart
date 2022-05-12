import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'service.dart';
import 'ui/layout.dart';

class ReferPresenter {
  final ReferService service;

  ReferPresenter(this.service);

  Widget get refer => ChangeNotifierProvider.value(
      value: service, child: const ReferUiBox());
}

import 'package:flutter/material.dart';

class UserAccountUtilsStyle{
  static const double _stdDeviceWidth = 375;

  final double _deviceWidth;
  final double _textScaleFactor;

  UserAccountUtilsStyle({MediaQueryData? mediaQueryData})
      : _textScaleFactor = mediaQueryData?.textScaleFactor ?? 1.0,
        _deviceWidth = mediaQueryData?.size.width ?? 375;

  double size(double raw) => (raw * (_deviceWidth / _stdDeviceWidth));

  double text(double raw) =>
      (raw * (_deviceWidth / _stdDeviceWidth)) * _textScaleFactor;
}
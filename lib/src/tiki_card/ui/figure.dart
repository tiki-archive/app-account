import 'package:flutter/material.dart';

class TikiCardUiFigure extends StatelessWidget {
  final Widget child;

  const TikiCardUiFigure(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: child);
  }
}

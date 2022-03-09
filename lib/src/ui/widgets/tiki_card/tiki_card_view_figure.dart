import 'package:flutter/material.dart';

class TikiCardViewFigure extends StatelessWidget {
  final Widget child;

  const TikiCardViewFigure(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: child);
  }
}

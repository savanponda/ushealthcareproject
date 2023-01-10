import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarView extends StatelessWidget {
  final Widget child;
  final bool isLight;

  const StatusBarView({required this.child, this.isLight=false});

  @override
  Widget build(BuildContext context) {


    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isLight?SystemUiOverlayStyle.light:SystemUiOverlayStyle.dark,
      child: child,
    );
  }
}
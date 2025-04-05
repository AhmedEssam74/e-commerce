import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Route<dynamic> buildRoute(
  Widget child,
) {
  final isIOS = defaultTargetPlatform == TargetPlatform.iOS;
  return isIOS
      ? CupertinoPageRoute(builder: (_) => child)
      : MaterialPageRoute(builder: (_) => child);
}

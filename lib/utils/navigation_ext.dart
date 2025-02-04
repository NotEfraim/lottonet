import 'package:flutter/material.dart';

extension NavigationExt on BuildContext {
  void navigate(String routeName, {Object? arg}) {
    Navigator.pushNamed(this, routeName, arguments: arg);
  }

  void popBackStack() {
    Navigator.pop(this);
  }

  void navigateAndFinish(String routeName, {Object? arg}) {
    Navigator.pushReplacementNamed(this, routeName, arguments: arg);
  }
}

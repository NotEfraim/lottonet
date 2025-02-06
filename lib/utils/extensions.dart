import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottonet/screens/loading_dialog/loading_dialog.dart';

void showLoading(BuildContext context) async {
  LoadingDialog.show(context);
}

void hideLoading(BuildContext context) async {
  LoadingDialog.hide(context);
}

void globalDialog(bool? isShow, BuildContext context) {
  if (isShow == true) {
    LoadingDialog.show(context);
  } else {
    hideLoading(context);
  }
}

extension Utils on int {
  String toCurrency() {
    final format =
        NumberFormat.currency(decimalDigits: 0, locale: 'he_IL', symbol: '');
    return format.format(this);
  }
}

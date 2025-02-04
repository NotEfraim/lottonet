import 'package:flutter/material.dart';
import 'package:lottonet/screens/dialogs/loading_dialog.dart';

void showLoading(BuildContext context) async {
    LoadingDialog.show(context);
}

void hideLoading(BuildContext context) async {
  LoadingDialog.hide(context);
}

void globalDialog(bool? isShow, BuildContext context){
  if(isShow == true) {
    LoadingDialog.show(context);
  } else {
    hideLoading(context);
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottonet/blocs/loading/loading_bloc.dart';
import 'package:lottonet/blocs/loading/loading_event.dart';

void showLoading(BuildContext context) {
  // final loadingBloc = context.read<LoadingBloc>();
  // loadingBloc.add(LoadingEventShow());
}

void hideLoading(BuildContext context) {
  // final loadingBloc = context.read<LoadingBloc>();
  // loadingBloc.add(LoadingEventHide());
}

extension Utils on int {
  String toCurrency() {
    final format =
        NumberFormat.currency(decimalDigits: 0, locale: 'he_IL', symbol: '');
    return format.format(this);
  }
}

import 'package:lottonet/blocs/base_state.dart';
import 'package:lottonet/models/profile/get_customer_data_response.dart';

class GetCustomerState extends BaseState {
  final bool? isLoading;
  final String? errorMsg;
  final GetCustomerDataResponse? response;

  GetCustomerState({this.isLoading, this.errorMsg, this.response});

  GetCustomerState copyWith(
      {bool? isLoading, String? errorMsg, GetCustomerDataResponse? response}) {
    return GetCustomerState(
        isLoading: isLoading ?? this.isLoading,
        errorMsg: errorMsg ?? this.errorMsg,
        response: response ?? this.response);
  }
}

class GetCustomerInitialState extends GetCustomerState {}

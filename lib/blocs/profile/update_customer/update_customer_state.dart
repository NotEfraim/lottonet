import 'package:lottonet/blocs/base_state.dart';
import 'package:lottonet/models/profile/update_customer_response.dart';

class UpdateCustomerState extends BaseState {
  final bool? isLoading;
  final String? errorMsg;
  final UpdateCustomerResponse? response;

  UpdateCustomerState({this.isLoading, this.errorMsg, this.response});

  UpdateCustomerState copyWith({
    bool? isLoading,
    String? errorMsg,
    UpdateCustomerResponse? response,
  }) {
    return UpdateCustomerState(
        isLoading: isLoading ?? this.isLoading,
        errorMsg: errorMsg ?? this.errorMsg,
        response: response ?? this.response);
  }
}

class UpdateCustomerInitialState extends UpdateCustomerState {}

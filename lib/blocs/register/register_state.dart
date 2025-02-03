import 'package:lottonet/blocs/base_state.dart';
import 'package:lottonet/models/register/register_user_response.dart';

class RegisterState extends BaseState {
  final bool? isLoading;
  final String? errorMsg;
  final RegisterUserResponse? response;

  RegisterState({this.isLoading, this.errorMsg, this.response});

  RegisterState copyWith(
      {bool? isLoading, String? errorMsg, RegisterUserResponse? response}) {
    return RegisterState(
        isLoading: isLoading ?? this.isLoading,
        errorMsg: errorMsg ?? this.errorMsg,
        response: response ?? this.response);
  }
}

class RegisterInitialState extends RegisterState {}

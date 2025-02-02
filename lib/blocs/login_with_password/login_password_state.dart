import 'package:lottonet/blocs/base_state.dart';
import 'package:lottonet/models/login_password/login_password_response.dart';

class LoginPasswordState extends BaseState {
  final bool? isLoading;
  final String? errorMsg;
  final LoginPasswordResponse? response;

  LoginPasswordState({this.isLoading, this.errorMsg, this.response});

  LoginPasswordState copyWith(
      {bool? isLoading, String? errorMsg, LoginPasswordResponse? response}) {
    return LoginPasswordState(
        isLoading: isLoading ?? this.isLoading,
        errorMsg: errorMsg ?? this.errorMsg,
        response: response ?? this.response);
  }
}

class LoginPasswordInitial extends LoginPasswordState {}

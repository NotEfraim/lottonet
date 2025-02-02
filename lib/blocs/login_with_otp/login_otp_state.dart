class LoginOtpState {
  final int? code;
  final bool? isLoading;
  final String? errorMsg;

  LoginOtpState({this.code, this.isLoading, this.errorMsg});

  LoginOtpState copyWith({int? code, bool? isLoading, String? errorMsg}) {
    return LoginOtpState(
        isLoading: isLoading ?? this.isLoading,
        errorMsg: errorMsg ?? this.errorMsg,
        code: code ?? this.code);
  }
}

class LoginOtpStateInitial extends LoginOtpState {}

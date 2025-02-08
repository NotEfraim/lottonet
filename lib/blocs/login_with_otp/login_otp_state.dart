class LoginOtpState {
  final int? code;
  final bool? isLoading;
  final String? errorMsg;
  final bool? isSendCodeSuccess;

  LoginOtpState({
    this.isSendCodeSuccess,
    this.code,
    this.isLoading,
    this.errorMsg,
  });

  LoginOtpState copyWith(
      {int? code, bool? isLoading, String? errorMsg, bool? isSendCodeSuccess}) {
    return LoginOtpState(
      isLoading: isLoading ?? this.isLoading,
      errorMsg: errorMsg ?? this.errorMsg,
      code: code ?? this.code,
      isSendCodeSuccess: isSendCodeSuccess ?? this.isSendCodeSuccess,
    );
  }
}

class LoginOtpStateInitial extends LoginOtpState {}

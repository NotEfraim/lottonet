class LoginOtpState {
  final int? code;
  final bool? isLoading;
  final String? errorMsg;
  final bool? isSendCodeSuccess;
  final bool? checkOTPSuccess;

  LoginOtpState(
      {this.isSendCodeSuccess,
      this.checkOTPSuccess,
      this.code,
      this.isLoading,
      this.errorMsg});

  LoginOtpState copyWith(
      {int? code,
      bool? isLoading,
      String? errorMsg,
      bool? isSendCodeSuccess,
      String? inputedIdentificationNumber,
      String? inputedMobileNumber,
      String? inputedOTPCode,
      bool? checkOTPSuccess}) {
    return LoginOtpState(
        isLoading: isLoading ?? this.isLoading,
        errorMsg: errorMsg ?? this.errorMsg,
        code: code ?? this.code,
        isSendCodeSuccess: isSendCodeSuccess ?? this.isSendCodeSuccess,
        checkOTPSuccess: checkOTPSuccess ?? this.checkOTPSuccess);
  }
}

class LoginOtpStateInitial extends LoginOtpState {}

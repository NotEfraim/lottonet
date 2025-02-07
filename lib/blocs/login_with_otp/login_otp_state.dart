class LoginOtpState {
  final int? code;
  final bool? isLoading;
  final String? errorMsg;
  final bool? isSendCodeSuccess;
  final bool? checkOTPSuccess;
  final String? pin1;
  final String? pin2;
  final String? pin3;
  final String? pin4;
  final String? pin5;

  LoginOtpState({
    this.isSendCodeSuccess,
    this.checkOTPSuccess,
    this.code,
    this.isLoading,
    this.errorMsg,
    this.pin1,
    this.pin2,
    this.pin3,
    this.pin4,
    this.pin5,
  });

  LoginOtpState copyWith({
    int? code,
    bool? isLoading,
    String? errorMsg,
    bool? isSendCodeSuccess,
    String? inputedIdentificationNumber,
    String? inputedMobileNumber,
    String? inputedOTPCode,
    bool? checkOTPSuccess,
    String? pin1,
    String? pin2,
    String? pin3,
    String? pin4,
    String? pin5,
  }) {
    return LoginOtpState(
        isLoading: isLoading ?? this.isLoading,
        errorMsg: errorMsg ?? this.errorMsg,
        code: code ?? this.code,
        isSendCodeSuccess: isSendCodeSuccess ?? this.isSendCodeSuccess,
        checkOTPSuccess: checkOTPSuccess ?? this.checkOTPSuccess,
        pin1: pin1 ?? this.pin1,
        pin2: pin2 ?? this.pin2,
        pin3: pin3 ?? this.pin3,
        pin4: pin4 ?? this.pin4,
        pin5: pin5 ?? this.pin5);
  }
}

class LoginOtpStateInitial extends LoginOtpState {}

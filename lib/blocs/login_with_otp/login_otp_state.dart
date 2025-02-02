class LoginOtpState {
  final bool? isLoading;
  final String? errorMsg;

  LoginOtpState({this.isLoading, this.errorMsg});

  LoginOtpState copyWith({bool? isLoading, String? errorMsg}) {
    return LoginOtpState(
        isLoading: isLoading ?? this.isLoading,
        errorMsg: errorMsg ?? this.errorMsg);
  }
}

class LoginOtpStateInitial extends LoginOtpState {}

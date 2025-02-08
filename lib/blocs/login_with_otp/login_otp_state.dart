class LoginOtpState {
  final int? code;
  final bool? isLoading;
  final String? errorMsg;
  final bool? isSendCodeSuccess;
  final bool? checkOTPSuccess;
  final List<String>? pinList;

  LoginOtpState({
    this.isSendCodeSuccess,
    this.checkOTPSuccess,
    this.code,
    this.isLoading,
    this.errorMsg,
    this.pinList
  });

List<String> updateList(int index, String value) {
  final newList = List<String>.from(pinList ?? ['','','','','']); // Create a new list copy
  newList[index] = value; // Update specific index
  return newList;
}

  LoginOtpState copyWith({
    int? code,
    bool? isLoading,
    String? errorMsg,
    bool? isSendCodeSuccess,
    String? inputedIdentificationNumber,
    String? inputedMobileNumber,
    String? inputedOTPCode,
    bool? checkOTPSuccess,
    List<String>? pinList
    
  }) {
    return LoginOtpState(
        isLoading: isLoading ?? this.isLoading,
        errorMsg: errorMsg ?? this.errorMsg,
        code: code ?? this.code,
        isSendCodeSuccess: isSendCodeSuccess ?? this.isSendCodeSuccess,
        checkOTPSuccess: checkOTPSuccess ?? this.checkOTPSuccess,
        pinList: pinList ?? this.pinList
        );
  }
}

class LoginOtpStateInitial extends LoginOtpState {}

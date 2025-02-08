import 'package:lottonet/blocs/base_state.dart';

class InputOtpState extends BaseState {
  final bool? isLoading;
  final String? errorMsg;
  final bool? isSuccess;
  final List<String>? pinList;

  InputOtpState({this.isLoading, this.errorMsg, this.isSuccess, this.pinList});

  List<String> updateList(int index, String value) {
    final newList = List<String>.from(
        pinList ?? ['', '', '', '', '']); // Create a new list copy
    newList[index] = value; // Update specific index
    return newList;
  }

  InputOtpState copyWith(
      {bool? isLoading,
      String? errorMsg,
      bool? isSuccess,
      List<String>? pinList}) {
    return InputOtpState(
        isLoading: isLoading ?? this.isLoading,
        errorMsg: errorMsg ?? this.errorMsg,
        isSuccess: isSuccess ?? this.isSuccess,
        pinList: pinList ?? this.pinList);
  }
}

class InputOtpInitState extends InputOtpState {}

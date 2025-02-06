import 'package:lottonet/blocs/base_state.dart';
import 'package:lottonet/models/main_sreen/main_screen_response.dart';

class MainScreenState extends BaseState {
  final bool? isLoading;
  final String? errorMsg;
  final MainScreenResponse? response;

  MainScreenState({this.isLoading, this.errorMsg, this.response});

  MainScreenState copyWith(
      {bool? isLoading, String? errorMsg, MainScreenResponse? response}) {
    return MainScreenState(
        errorMsg: errorMsg ?? this.errorMsg,
        isLoading: isLoading ?? this.isLoading,
        response: response ?? this.response);
  }
}

class MainScreenInitial extends MainScreenState {}

import 'package:lottonet/blocs/base_state.dart';
import 'package:lottonet/models/loading/loading_response.dart';

class LoadingState extends BaseState {
  final bool? isLoading;
  final String? errorMsg;
  final LoadingResponse? response;

  LoadingState({this.isLoading, this.errorMsg, this.response});

  LoadingState copyWith(
      {bool? isLoading, String? errorMsg, LoadingResponse? response}) {
    return LoadingState(
        isLoading: isLoading ?? this.isLoading,
        errorMsg: errorMsg ?? this.errorMsg,
        response: response ?? this.response);
  }
}

class LoadingInitialState extends LoadingState {}

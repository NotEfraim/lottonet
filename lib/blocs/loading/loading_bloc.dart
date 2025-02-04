import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottonet/blocs/base_event.dart';
import 'package:lottonet/blocs/loading/loading_event.dart';
import 'package:lottonet/blocs/loading/loading_state.dart';
import 'package:lottonet/repositories/loading/loading_repository.dart';

class LoadingBloc extends Bloc<BaseEvent, LoadingState>{
  final LoadingRepository loadingRepository;
  LoadingBloc(this.loadingRepository) : super(LoadingInitialState()){
    on<LoadingEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try{
        final response = await loadingRepository.checkBearerToken();
        emit(state.copyWith(isLoading: false,response: response));
      }catch(e){
        emit(state.copyWith(isLoading: false, errorMsg: e.toString()));
      }
      
    },);
  }



}
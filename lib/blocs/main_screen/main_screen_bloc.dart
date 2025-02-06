import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottonet/blocs/base_event.dart';
import 'package:lottonet/blocs/main_screen/main_screen_event.dart';
import 'package:lottonet/blocs/main_screen/main_screen_state.dart';
import 'package:lottonet/repositories/main_screen/get_main_page_repository.dart';

class MainScreenBloc extends Bloc<BaseEvent, MainScreenState> {
  final GetMainPageRepository getMainPageRepository;
  MainScreenBloc(this.getMainPageRepository) : super(MainScreenInitial()) {
    on<MainScreenEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        try {
          final response = await getMainPageRepository.getMainPageData();
          emit(state.copyWith(isLoading: false, response: response));
        } catch (e) {
          emit(state.copyWith(isLoading: false, errorMsg: e.toString()));
        }
      },
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottonet/blocs/base_event.dart';
import 'package:lottonet/blocs/register/register_event.dart';
import 'package:lottonet/blocs/register/register_state.dart';
import 'package:lottonet/repositories/register/create_user_repository.dart';
import 'package:lottonet/utils/http_logger.dart';

class RegisterBloc extends Bloc<BaseEvent, RegisterState> {
  final CreateUserRepository createUserRepository;
  RegisterBloc(this.createUserRepository) : super(RegisterInitialState()) {
    on<RegisterEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        try {
          final response = await createUserRepository.createUser(event.param);
          HttpLogger("HTTP", '${response.toJson()}');
          Fluttertoast.showToast(msg: '${response.toJson()}');
          emit(state.copyWith(isLoading: false, response: response));
        } catch (e) {
          HttpLogger('HTTP', e.toString());
          emit(state.copyWith(isLoading: false, errorMsg: e.toString()));
        }
      },
    );
  }
}

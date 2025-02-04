import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottonet/blocs/base_event.dart';
import 'package:lottonet/blocs/login_with_password/login_password_event.dart';
import 'package:lottonet/blocs/login_with_password/login_password_state.dart';
import 'package:lottonet/repositories/login_password/login_password_repository.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/shared_pref.dart';

class LoginPasswordBloc extends Bloc<BaseEvent, LoginPasswordState> {
  final LoginPasswordRepository loginPasswordRepository;
  LoginPasswordBloc(this.loginPasswordRepository)
      : super(LoginPasswordInitial()) {
    on<LoginPasswordEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        try {
          final response =
              await loginPasswordRepository.loginWithPassword(event.param);
          emit(state.copyWith(isLoading: false,response: response));
          if(response.result == 0){
            saveData(Constants.tokenKey, response.token);
          }
          Fluttertoast.showToast(msg: "Success ${response.toJson()}");
        } catch (e) {
          emit(state.copyWith(isLoading: false, errorMsg: e.toString()));
          Fluttertoast.showToast(msg: "Success ${e.toString()}");
        }
      },
    );
  }
}

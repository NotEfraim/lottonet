import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_event.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_state.dart';

class LoginOtpBloc extends Bloc<LoginOtpEvent, LoginOtpState> {
  LoginOtpBloc() : super(LoginOtpStateInitial()) {
    on<LoginOtpEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        try {
          emit(state.copyWith(isLoading: false));
        } catch (e) {
          emit(state.copyWith(errorMsg: e.toString()));
        }
      },
    );
  }
}

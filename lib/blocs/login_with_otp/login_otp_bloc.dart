import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_event.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_state.dart';
import 'package:lottonet/repositories/send_code_repository.dart';

class LoginOtpBloc extends Bloc<LoginOtpEvent, LoginOtpState> {
  final SendCodeRepository repository;

  LoginOtpBloc(this.repository) : super(LoginOtpStateInitial()) {
    on<LoginOtpEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        try {
          final response = await repository.sendOTP(event.param);
          emit(state.copyWith(isLoading: false, code: response.result));
        } catch (e) {
          emit(state.copyWith(errorMsg: e.toString()));
        }
      },
    );
  }
}

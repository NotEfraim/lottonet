import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottonet/blocs/base_event.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_event.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_state.dart';
import 'package:lottonet/repositories/login_otp/send_code_repository.dart';
import 'package:lottonet/utils/http_logger.dart';

class LoginOtpBloc extends Bloc<BaseEvent, LoginOtpState> {
  final SendCodeRepository sendCodeRepository;

  LoginOtpBloc(this.sendCodeRepository) : super(LoginOtpStateInitial()) {
    on<LoginOtpEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        try {
          final response = await sendCodeRepository.sendOTP(event.param);
          HttpLogger("HTTP", "Success");
          Fluttertoast.showToast(msg: response.message ?? 'Success');
          emit(state.copyWith(
              isLoading: false, isSendCodeSuccess: response.result == 0));
        } catch (e) {
          HttpLogger("HTTP", e.toString());
          emit(state.copyWith(isLoading: false, errorMsg: e.toString()));
        }
      },
    );
  }
}

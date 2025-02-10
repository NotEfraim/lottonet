import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottonet/blocs/base_event.dart';
import 'package:lottonet/blocs/input_otp/input_otp_event.dart';
import 'package:lottonet/blocs/input_otp/input_otp_state.dart';
import 'package:lottonet/main.dart';
import 'package:lottonet/repositories/login_otp/check_login_code_repository.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/http_logger.dart';
import 'package:lottonet/utils/shared_pref.dart';

class InputOtpBloc extends Bloc<BaseEvent, InputOtpState> {
  final CheckLoginCodeRepository checkLoginCodeRepository;
  InputOtpBloc(this.checkLoginCodeRepository) : super(InputOtpInitState()) {
    on<CheckLoginCodeEvent>(
      (event, emit) async {
        emit(state.copyWith(
            isLoading: true, isSuccess: false, pinList: ['', '', '', '', '']));
        try {
          final response =
              await checkLoginCodeRepository.checkLoginOTP(event.param);
          if (response.token != null) {
            activeToken = response.token ?? '';
            await saveData(Constants.tokenKey, response.token);
          }
          emit(state.copyWith(
              isLoading: false, isSuccess: response.result == 0));
          HttpLogger("HTTP", "Success");
          Fluttertoast.showToast(msg: response.message ?? 'Success');
        } catch (e) {
          HttpLogger("HTTP", e.toString());
          emit(state.copyWith(isLoading: false, errorMsg: e.toString()));
        }
      },
    );

    on<UpdatePin>(
      (event, emit) async {
        final pinList = state.updateList(event.index, event.value);
        emit(state.copyWith(pinList: pinList));
      },
    );
  }
}

import 'package:lottonet/blocs/base_event.dart';
import 'package:lottonet/models/login_otp/check_login_code/check_login_code_param.dart';

class InputOtpEvent extends BaseEvent {}

class CheckLoginCodeEvent extends BaseEvent {
  final CheckLoginCodeParam param;
  CheckLoginCodeEvent(this.param);
}

class UpdatePin extends BaseEvent {
  final int index;
  final String value;
  UpdatePin(this.index, this.value);
}

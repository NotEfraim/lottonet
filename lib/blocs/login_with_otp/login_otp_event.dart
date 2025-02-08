import 'package:lottonet/blocs/base_event.dart';
import 'package:lottonet/models/login_otp/check_login_code/check_login_code_param.dart';
import 'package:lottonet/models/login_otp/send_code/send_code_param.dart';

class LoginOtpEvent extends BaseEvent {
  final SendCodeParam param;
  LoginOtpEvent(this.param);
}

class CheckLoginCodeEvent extends BaseEvent {
  final CheckLoginCodeParam param;
  CheckLoginCodeEvent(this.param);
}

class InitPinList extends BaseEvent {
  final List<String> pinList;
  InitPinList(this.pinList);
}

class UpdatePin extends BaseEvent {
  final int index;
  final String value;
  UpdatePin(this.index, this.value);
}
import 'package:lottonet/blocs/base_event.dart';
import 'package:lottonet/models/send_code/send_code_param.dart';

class LoginOtpEvent extends BaseEvent {
  final SendCodeParam param;
  LoginOtpEvent(this.param);
}

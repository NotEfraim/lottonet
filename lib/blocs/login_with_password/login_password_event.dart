import 'package:lottonet/blocs/base_event.dart';
import 'package:lottonet/models/login_password/login_password_param.dart';

class LoginPasswordEvent extends BaseEvent {
  final LoginPasswordParam param;
  LoginPasswordEvent(this.param);
}

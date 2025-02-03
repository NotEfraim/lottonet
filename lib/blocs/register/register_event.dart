import 'package:lottonet/blocs/base_event.dart';
import 'package:lottonet/models/register/register_user_param.dart';

class RegisterEvent extends BaseEvent {
  final RegisterUserParam param;
  RegisterEvent(this.param);
}

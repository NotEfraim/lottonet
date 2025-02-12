import 'package:lottonet/blocs/base_event.dart';
import 'package:lottonet/models/profile/update_customer_param.dart';

class UpdateCustomerEvent extends BaseEvent {
  final UpdateCustomerParam param;
  UpdateCustomerEvent(this.param);
}

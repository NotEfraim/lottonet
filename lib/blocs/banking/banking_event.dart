import 'package:lottonet/blocs/base_event.dart';
import 'package:lottonet/models/banking/add_card/charge_credit_card_param.dart';
import 'package:lottonet/models/banking/charge_card/charge_existing_card_param.dart';

class GetCrediCardsEvent extends BaseEvent {}

class ChargeCreditCardEvent extends BaseEvent {
  final ChargeCreditCardParam param;
  ChargeCreditCardEvent(this.param);
}

class ChargeExisitingCreditCardEvent extends BaseEvent {
  final ChargeExistingCardParam param;
  ChargeExisitingCreditCardEvent(this.param);
}

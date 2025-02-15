import 'package:lottonet/models/banking/add_card/charge_credit_card_param.dart';
import 'package:lottonet/models/banking/add_card/charge_credit_card_response.dart';
import 'package:lottonet/models/banking/charge_card/charge_existing_card_param.dart';
import 'package:lottonet/models/banking/charge_card/charge_existing_card_response.dart';
import 'package:lottonet/models/banking/get_card/get_credit_cards_response.dart';
import 'package:lottonet/services/dio_interceptor.dart';
import 'package:lottonet/services/rest_client.dart';

class BankingRepository {
  final RestClient client;

  BankingRepository() : client = RestClient(dioInterceptor());

  Future<GetCreditCardsResponse> getCreditCards() {
    return client.getCreditCards();
  }

  Future<ChargeCreditCardResponse> chargeCreditCards(
      ChargeCreditCardParam param) {
    return client.chargeCreditCards(param);
  }

  Future<ChargeExistingCardResponse> chargeExistingCard(
      ChargeExistingCardParam param) {
    return client.chargeExistingCard(param);
  }
}

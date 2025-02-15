import 'package:lottonet/models/banking/add_card/charge_credit_card_response.dart';
import 'package:lottonet/models/banking/charge_card/charge_existing_card_response.dart';
import 'package:lottonet/models/banking/get_card/get_credit_cards_response.dart';

class BankingState {
  final bool? isLoading;
  final String? errorMsg;
  final GetCreditCardsResponse? getCreditCardsResponse;
  final ChargeCreditCardResponse? chargeCreditCardResponse;
  final ChargeExistingCardResponse? chargeExistingCardResponse;

  BankingState(
      {this.isLoading,
      this.errorMsg,
      this.getCreditCardsResponse,
      this.chargeCreditCardResponse,
      this.chargeExistingCardResponse});

  BankingState copyWith({
    bool? isLoading,
    String? errorMsg,
    GetCreditCardsResponse? getCreditCardsResponse,
    ChargeCreditCardResponse? chargeCreditCardResponse,
    ChargeExistingCardResponse? chargeExistingCardResponse,
  }) {
    return BankingState(
        isLoading: isLoading ?? this.isLoading,
        errorMsg: errorMsg ?? this.errorMsg,
        getCreditCardsResponse:
            getCreditCardsResponse ?? this.getCreditCardsResponse,
        chargeCreditCardResponse:
            chargeCreditCardResponse ?? this.chargeCreditCardResponse,
        chargeExistingCardResponse:
            chargeExistingCardResponse ?? this.chargeExistingCardResponse);
  }
}

class BankInitialState extends BankingState {}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottonet/blocs/banking/banking_event.dart';
import 'package:lottonet/blocs/banking/banking_state.dart';
import 'package:lottonet/blocs/base_event.dart';
import 'package:lottonet/repositories/banking/banking_repository.dart';

class BankingBloc extends Bloc<BaseEvent, BankingState> {
  final BankingRepository bankingRepository;
  BankingBloc(this.bankingRepository) : super(BankInitialState()) {
    on<GetCrediCardsEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true, getCreditCardsResponse: null));
        try {
          final response = await bankingRepository.getCreditCards();
          emit(state.copyWith(
              isLoading: false, getCreditCardsResponse: response));
        } catch (e) {
          emit(state.copyWith(isLoading: false, getCreditCardsResponse: null));
        }
      },
    );

    on<ChargeCreditCardEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true, chargeCreditCardResponse: null));
        try {
          final response =
              await bankingRepository.chargeCreditCards(event.param);
          emit(state.copyWith(
              isLoading: false, chargeCreditCardResponse: response));
          if (response.result == 0) {
            add(GetCrediCardsEvent());
          }
        } catch (e) {
          emit(
              state.copyWith(isLoading: false, chargeCreditCardResponse: null));
        }
      },
    );

    on<ChargeExisitingCreditCardEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true, chargeExistingCardResponse: null));
        try {
          final response =
              await bankingRepository.chargeExistingCard(event.param);
          emit(state.copyWith(
              isLoading: false, chargeExistingCardResponse: response));
        } catch (e) {
          emit(state.copyWith(
              isLoading: false, chargeExistingCardResponse: null));
        }
      },
    );
  }
}

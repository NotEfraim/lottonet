import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottonet/blocs/base_event.dart';
import 'package:lottonet/blocs/profile/update_customer/update_customer_event.dart';
import 'package:lottonet/blocs/profile/update_customer/update_customer_state.dart';
import 'package:lottonet/repositories/profile/update_customer_repository.dart';

class UpdateCustomerBloc extends Bloc<BaseEvent, UpdateCustomerState> {
  final UpdateCustomerRepository updateCustomerRepository;

  UpdateCustomerBloc(this.updateCustomerRepository)
      : super(UpdateCustomerInitialState()) {
    on<UpdateCustomerEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true, response: null));
        try {
          final response =
              await updateCustomerRepository.updateCustomer(event.param);
          emit(state.copyWith(isLoading: false, response: response));
          Fluttertoast.showToast(msg: response.message ?? 'Profile Updated!');
        } catch (e) {
          emit(state.copyWith(isLoading: false, response: null));
        }
      },
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottonet/blocs/base_event.dart';
import 'package:lottonet/blocs/profile/get_customer/get_customer_event.dart';
import 'package:lottonet/blocs/profile/get_customer/get_customer_state.dart';
import 'package:lottonet/repositories/profile/get_customer_data_repository.dart';

class GetCustomerDataBloc extends Bloc<BaseEvent, GetCustomerState> {
  final GetCustomerDataRepository getCustomerDataRepository;
  GetCustomerDataBloc(this.getCustomerDataRepository)
      : super(GetCustomerInitialState()) {
    on<GetCustomerEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        try {
          final response = await getCustomerDataRepository.getCustomerData();
          emit(state.copyWith(isLoading: false, response: response));
        } catch (e) {
          emit(state.copyWith(errorMsg: e.toString()));
          Fluttertoast.showToast(msg: e.toString());
        }
      },
    );
  }
}

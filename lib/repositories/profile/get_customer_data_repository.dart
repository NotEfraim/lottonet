import 'package:lottonet/models/profile/get_customer_data_response.dart';
import 'package:lottonet/services/dio_interceptor.dart';
import 'package:lottonet/services/rest_client.dart';

class GetCustomerDataRepository {
  final RestClient client;
  GetCustomerDataRepository() : client = RestClient(dioInterceptor());

  Future<GetCustomerDataResponse> getCustomerData() async {
    return client.getCustomerData();
  }
}

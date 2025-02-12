import 'package:lottonet/models/profile/update_customer_param.dart';
import 'package:lottonet/models/profile/update_customer_response.dart';
import 'package:lottonet/services/dio_interceptor.dart';
import 'package:lottonet/services/rest_client.dart';

class UpdateCustomerRepository {
  final RestClient client;
  UpdateCustomerRepository() : client = RestClient(dioInterceptor());

  Future<UpdateCustomerResponse> updateCustomer(
      UpdateCustomerParam param) async {
    return client.updateCustomer(param);
  }
}

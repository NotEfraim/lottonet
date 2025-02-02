import 'package:lottonet/models/send_code/send_code_param.dart';
import 'package:lottonet/models/send_code/send_code_response.dart';
import 'package:lottonet/services/dio_interceptor.dart';
import 'package:lottonet/services/rest_client.dart';

class SendCodeRepository {
  final RestClient client;

  SendCodeRepository() : client = RestClient(dioInterceptor());

  Future<SendCodeResponse> sendOTP(SendCodeParam param) async {
    return await client.sendOTP(param);
  }
}

import 'package:lottonet/models/check_login_code/check_login_code_param.dart';
import 'package:lottonet/models/check_login_code/check_login_code_response.dart';
import 'package:lottonet/services/dio_interceptor.dart';
import 'package:lottonet/services/rest_client.dart';

class CheckLoginCodeRepository {
  final RestClient client;
  CheckLoginCodeRepository() : client = RestClient(dioInterceptor());

  Future<CheckLoginCodeResponse> checkLoginOTP(
      CheckLoginCodeParam param) async {
    return client.checkLoginOTP(param);
  }
}

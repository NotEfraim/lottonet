import 'package:lottonet/models/login_password/login_password_param.dart';
import 'package:lottonet/models/login_password/login_password_response.dart';
import 'package:lottonet/services/dio_interceptor.dart';
import 'package:lottonet/services/rest_client.dart';

class LoginPasswordRepository {
  final RestClient client;
  LoginPasswordRepository() : client = RestClient(dioInterceptor());

  Future<LoginPasswordResponse> loginWithPassword(
      LoginPasswordParam param) async {
    return await client.loginWithPassword(param);
  }
}

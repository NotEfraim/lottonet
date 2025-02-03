import 'package:lottonet/models/register/register_user_param.dart';
import 'package:lottonet/models/register/register_user_response.dart';
import 'package:lottonet/services/dio_interceptor.dart';
import 'package:lottonet/services/rest_client.dart';

class CreateUserRepository {
  final RestClient client;
  CreateUserRepository() : client = RestClient(dioInterceptor());

  Future<RegisterUserResponse> createUser(RegisterUserParam param) async {
    return await client.createUser(param);
  }
}

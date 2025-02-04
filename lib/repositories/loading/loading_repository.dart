import 'package:lottonet/models/loading/loading_response.dart';
import 'package:lottonet/services/dio_interceptor.dart';
import 'package:lottonet/services/rest_client.dart';

class LoadingRepository {
  final RestClient client;
  LoadingRepository() : client = RestClient(dioInterceptor());

  Future<LoadingResponse> checkBearerToken() async {
    return client.checkBearerToken();
  }

}
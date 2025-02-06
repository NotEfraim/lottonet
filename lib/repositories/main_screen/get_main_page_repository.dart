import 'package:lottonet/models/main_sreen/main_screen_response.dart';
import 'package:lottonet/services/dio_interceptor.dart';
import 'package:lottonet/services/rest_client.dart';

class GetMainPageRepository {
  final RestClient client;
  GetMainPageRepository() : client = RestClient(dioInterceptor());

  Future<MainScreenResponse> getMainPageData() async {
    return client.getMainPageData();
  }
}

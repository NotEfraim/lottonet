import 'package:dio/dio.dart';
import 'package:lottonet/models/send_code/send_code_param.dart';
import 'package:lottonet/models/send_code/send_code_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://tahana.co.il:8028/d3ff2c1e090/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @POST("/sendLoginCodeToCustomer")
  Future<SendCodeResponse> sendOTP(@Body() SendCodeParam param);
}

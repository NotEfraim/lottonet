import 'package:dio/dio.dart';
import 'package:lottonet/models/loading/loading_response.dart';
import 'package:lottonet/models/login_otp/check_login_code/check_login_code_param.dart';
import 'package:lottonet/models/login_otp/check_login_code/check_login_code_response.dart';
import 'package:lottonet/models/login_otp/send_code/send_code_param.dart';
import 'package:lottonet/models/login_otp/send_code/send_code_response.dart';
import 'package:lottonet/models/login_password/login_password_param.dart';
import 'package:lottonet/models/login_password/login_password_response.dart';
import 'package:lottonet/models/main_sreen/main_screen_response.dart';
import 'package:lottonet/models/profile/get_customer_data_response.dart';
import 'package:lottonet/models/register/register_user_param.dart';
import 'package:lottonet/models/register/register_user_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://tahana.co.il:8028/d3ff2c1e090/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @POST("/sendLoginCodeToCustomer")
  Future<SendCodeResponse> sendOTP(@Body() SendCodeParam param);

  @POST("/checkLoginCode")
  Future<CheckLoginCodeResponse> checkLoginOTP(
      @Body() CheckLoginCodeParam param);

  @POST("/loginWithPassword")
  Future<LoginPasswordResponse> loginWithPassword(
      @Body() LoginPasswordParam param);

  @POST("/createCustomer")
  Future<RegisterUserResponse> createUser(@Body() RegisterUserParam param);

  @POST("/checkBearerToken")
  Future<LoadingResponse> checkBearerToken();

  @POST("/getMainPageData")
  Future<MainScreenResponse> getMainPageData();

  @POST("/getCustomer")
  Future<GetCustomerDataResponse> getCustomerData();
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottonet/blocs/loading/loading_bloc.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_bloc.dart';
import 'package:lottonet/blocs/login_with_password/login_password_bloc.dart';
import 'package:lottonet/blocs/main_screen/main_screen_bloc.dart';
import 'package:lottonet/blocs/register/register_bloc.dart';
import 'package:lottonet/repositories/loading/loading_repository.dart';
import 'package:lottonet/repositories/login_otp/check_login_code_repository.dart';
import 'package:lottonet/repositories/login_otp/send_code_repository.dart';
import 'package:lottonet/repositories/login_password/login_password_repository.dart';
import 'package:lottonet/repositories/main_screen/get_main_page_repository.dart';
import 'package:lottonet/repositories/register/create_user_repository.dart';
import 'package:lottonet/screens/loading_screen/loading_screen.dart';
import 'package:lottonet/screens/login/login_layout.dart';
import 'package:lottonet/screens/main_screen/main_screen.dart';
import 'package:lottonet/screens/register/register_layout.dart';
import 'package:lottonet/utils/routes.dart';

String activeToken = '';

void main() {
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginOtpBloc(
              SendCodeRepository(),
              CheckLoginCodeRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => LoginPasswordBloc(
              LoginPasswordRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => RegisterBloc(
              CreateUserRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => LoadingBloc(
              LoadingRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => MainScreenBloc(
              GetMainPageRepository(),
            ),
          )
        ],
        child: MaterialApp(
          title: "Lotto Net",
          initialRoute: Routes.loadingScreen,
          routes: {
            Routes.loadingScreen: (context) => const LoadingScreen(),
            Routes.login: (context) => const LoginLayout(),
            Routes.register: (context) => const RegisterLayout(),
            Routes.mainScreen: (context) => const MainScreen()
          },
        )),
  );
}

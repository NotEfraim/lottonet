import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottonet/blocs/banking/banking_bloc.dart';
import 'package:lottonet/blocs/input_otp/input_otp_bloc.dart';
import 'package:lottonet/blocs/loading/loading_bloc.dart';
import 'package:lottonet/blocs/loading/loading_state.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_bloc.dart';
import 'package:lottonet/blocs/login_with_password/login_password_bloc.dart';
import 'package:lottonet/blocs/main_screen/main_screen_bloc.dart';
import 'package:lottonet/blocs/profile/get_customer/get_customer_data_bloc.dart';
import 'package:lottonet/blocs/profile/update_customer/update_customer_bloc.dart';
import 'package:lottonet/blocs/register/register_bloc.dart';
import 'package:lottonet/repositories/banking/banking_repository.dart';
import 'package:lottonet/repositories/loading/loading_repository.dart';
import 'package:lottonet/repositories/login_otp/check_login_code_repository.dart';
import 'package:lottonet/repositories/login_otp/send_code_repository.dart';
import 'package:lottonet/repositories/login_password/login_password_repository.dart';
import 'package:lottonet/repositories/main_screen/get_main_page_repository.dart';
import 'package:lottonet/repositories/profile/get_customer_data_repository.dart';
import 'package:lottonet/repositories/profile/update_customer_repository.dart';
import 'package:lottonet/repositories/register/create_user_repository.dart';
import 'package:lottonet/screens/bank/payment_screen.dart';
import 'package:lottonet/screens/loading_screen/loading_screen.dart';
import 'package:lottonet/screens/login/login_layout.dart';
import 'package:lottonet/screens/login/widget/with_otp/input_otp.dart';
import 'package:lottonet/screens/main_screen/main_screen.dart';
import 'package:lottonet/screens/profile_navigation/navs/personal_data.dart';
import 'package:lottonet/screens/profile_navigation/profile_navigation.dart';
import 'package:lottonet/screens/register/register_layout.dart';
import 'package:lottonet/utils/routes.dart';

String activeToken = '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginOtpBloc(SendCodeRepository()),
        ),
        BlocProvider(
          create: (context) => LoginPasswordBloc(LoginPasswordRepository()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(CreateUserRepository()),
        ),
        BlocProvider(
          create: (context) => LoadingBloc(LoadingRepository()),
        ),
        BlocProvider(
          create: (context) => MainScreenBloc(GetMainPageRepository()),
        ),
        BlocProvider(
          create: (context) => InputOtpBloc(CheckLoginCodeRepository()),
        ),
        BlocProvider(
          create: (context) => GetCustomerDataBloc(
            GetCustomerDataRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => UpdateCustomerBloc(
            UpdateCustomerRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => BankingBloc(
            BankingRepository(),
          ),
        )
      ],
      child: MaterialApp(
        title: "Lotto Net",
        initialRoute: Routes.loadingScreen,
        routes: {
          Routes.loadingScreen: (context) => const PaymentScreen(),
          Routes.login: (context) => const LoginLayout(),
          Routes.register: (context) => const RegisterLayout(),
          Routes.mainScreen: (context) => const MainScreen(),
          Routes.inputOtp: (context) => const InputOtp(),
          Routes.profileNavigation: (context) => const ProfileNavigation(),
          Routes.personalData: (context) => const PersonalData()
        },
        builder: (context, child) {
          return Stack(
            children: [
              child ?? Container(),
              BlocBuilder<LoadingBloc, LoadingState>(
                builder: (context, state) {
                  return state.isLoading ?? false
                      ? Container(
                          color: Colors.black.withOpacity(0.5),
                          child: Center(
                              child: LoadingAnimationWidget.inkDrop(
                            color: Colors.white,
                            size: 35, // Increased size for better visibility
                          )),
                        )
                      : const SizedBox.shrink();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

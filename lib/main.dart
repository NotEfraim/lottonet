import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_bloc.dart';
import 'package:lottonet/repositories/login_otp/check_login_code_repository.dart';
import 'package:lottonet/repositories/login_otp/send_code_repository.dart';
import 'package:lottonet/screens/login/login_layout.dart';
import 'package:lottonet/screens/login/widget/background_image_screen.dart';

void main() {
  runApp(MaterialApp(
    home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => LoginOtpBloc(
                  SendCodeRepository(), CheckLoginCodeRepository()))
        ],
        child: const Stack(
          children: [BackgroundImageScreen(), LoginLayout()],
        )),
  ));
}

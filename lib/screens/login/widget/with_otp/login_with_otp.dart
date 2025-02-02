import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_bloc.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_event.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_state.dart';
import 'package:lottonet/models/check_login_code/check_login_code_param.dart';
import 'package:lottonet/models/send_code/send_code_param.dart';
import 'package:lottonet/screens/login/widget/rounded_text_field.dart';

class LoginWithOtp extends StatefulWidget {
  final double textFieldheight;
  final double textFieldwidth;

  const LoginWithOtp(
      {super.key, required this.textFieldheight, required this.textFieldwidth});

  @override
  State<StatefulWidget> createState() => _LoginWithOtpState();
}

class _LoginWithOtpState extends State<LoginWithOtp> {
  String custId = "";
  String mobile = "";
  String otp = "";

  @override
  Widget build(BuildContext context) {
    final loginOTPBloc = context.read<LoginOtpBloc>();

    void buttonClickFunction(bool? isSendCodeSuccess) {
      if (isSendCodeSuccess == true) {
        loginOTPBloc.add(CheckLoginCodeEvent(CheckLoginCodeParam(
            uniqe_id: "ffc22d20-d7db-11ef-97aa-5b10ceba786f",
            mobile: mobile,
            code: otp)));
      } else {
        loginOTPBloc.add(LoginOtpEvent(SendCodeParam(
            uniqe_id: "ffc22d20-d7db-11ef-97aa-5b10ceba786f",
            mobile: mobile,
            custId: custId)));
      }
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0), // Add padding for better spacing
              child: BlocBuilder<LoginOtpBloc, LoginOtpState>(
                  builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    //Identity Card Number
                    SizedBox(
                      height: widget.textFieldheight,
                      width: widget.textFieldwidth,
                      child: RoundedTextField(
                        "תעודת זהות",
                        false,
                        onTextChange: (it) {
                          custId = it;
                        },
                      ),
                    ),
                    // Phone Number
                    SizedBox(
                      height: widget.textFieldheight,
                      width: widget.textFieldwidth,
                      child: RoundedTextField(
                        "טלפון",
                        false,
                        onTextChange: (it) {
                          mobile = it;
                        },
                      ),
                    ),

                    //OTP Code
                    if (state.isSendCodeSuccess == true)
                      SizedBox(
                        height: widget.textFieldheight,
                        width: widget.textFieldwidth,
                        child: RoundedTextField(
                          "קוד",
                          false,
                          onTextChange: (it) {
                            otp = it;
                          },
                        ),
                      ),
                    SizedBox(
                      width: widget.textFieldwidth - 20,
                      child: const Text(
                          "בהתחברות שלי לאפליקציה אני מאשר אתתנאי השימוש ומדיניות הפרטיות שלהאפליקציה",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: widget.textFieldwidth * .6,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC71D26),
                        ),
                        child: const Text(
                          "כְּנִיסָה לַמַעֲרֶכֶת",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          buttonClickFunction(state.isSendCodeSuccess);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: widget.textFieldwidth,
                      child: const Text("משתמש חדש? הרשם כאן",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

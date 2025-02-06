import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_bloc.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_event.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_state.dart';
import 'package:lottonet/models/login_otp/check_login_code/check_login_code_param.dart';
import 'package:lottonet/models/login_otp/send_code/send_code_param.dart';
import 'package:lottonet/screens/login/widget/rounded_text_field.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/extensions.dart';
import 'package:lottonet/utils/navigation_ext.dart';
import 'package:lottonet/utils/routes.dart';

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
  bool custIdError = false;
  String mobile = "";
  bool mobileError = false;
  String otp = "";
  bool otpError = false;

  @override
  Widget build(BuildContext context) {
    final loginOTPBloc = context.read<LoginOtpBloc>();

    void buttonClickFunction(bool? isSendCodeSuccess) {
      setState(() {
        custIdError = custId.isEmpty;
        mobileError = mobile.isEmpty;
      });

      if (custId.isNotEmpty && mobile.isNotEmpty) {
        showLoading(context);
      }

      if (isSendCodeSuccess == true) {
        setState(() {
          otpError = otp.isEmpty;
        });

        if (otpError) {
          Fluttertoast.showToast(msg: "All Field is required!");
          return;
        }

        loginOTPBloc.add(CheckLoginCodeEvent(CheckLoginCodeParam(
            uniqe_id: Constants.uniqueId, mobile: mobile, code: otp)));
      } else {
        if (custIdError || mobileError) {
          Fluttertoast.showToast(msg: "All Field is required!");
          return;
        }

        loginOTPBloc.add(LoginOtpEvent(SendCodeParam(
            uniqe_id: Constants.uniqueId, mobile: mobile, custId: custId)));
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
              child: BlocConsumer<LoginOtpBloc, LoginOtpState>(
                  listener: (context, state) {
                if (state.isLoading == false) hideLoading(context);
                if (state.checkOTPSuccess == true) {
                  context.navigateAndFinish(Routes.mainScreen);
                }
              }, builder: (context, state) {
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
                        custIdError,
                        isDigitOnly: true,
                        onTextChange: (it) {
                          if (it.isNotEmpty && custIdError) {
                            setState(() {
                              custIdError = false;
                            });
                          }
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
                        mobileError,
                        isDigitOnly: true,
                        onTextChange: (it) {
                          if (it.isNotEmpty && mobileError) {
                            setState(() {
                              mobileError = false;
                            });
                          }
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
                          otpError,
                          isDigitOnly: true,
                          onTextChange: (it) {
                            if (it.isNotEmpty && otpError) {
                              setState(() {
                                otpError = false;
                              });
                            }
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
                        width: widget.textFieldwidth * .8,
                        child: TextButton(
                          onPressed: () {
                            context.navigate(Routes.register);
                          },
                          child: const Text("משתמש חדש? הרשם כאן",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white)),
                        )),
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

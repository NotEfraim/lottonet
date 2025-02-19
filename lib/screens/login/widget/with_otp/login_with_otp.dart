import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottonet/blocs/loading/loading_bloc.dart';
import 'package:lottonet/blocs/loading/loading_event.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_bloc.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_event.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_state.dart';
import 'package:lottonet/models/login_otp/check_login_code/check_login_code_param.dart';
import 'package:lottonet/models/login_otp/send_code/send_code_param.dart';
import 'package:lottonet/screens/login/widget/rounded_text_field.dart';
import 'package:lottonet/utils/constants.dart';
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
  final List<FocusNode> _focusNode = List.generate(2, (index) => FocusNode());
  String custId = "";
  bool custIdError = false;
  String mobile = "";
  bool mobileError = false;

  @override
  Widget build(BuildContext context) {
    final loginOTPBloc = context.read<LoginOtpBloc>();
    final loadingBloc = context.read<LoadingBloc>();

    void buttonClickFunction() {
      setState(() {
        custIdError = custId.isEmpty;
        mobileError = mobile.isEmpty;
      });

      if (custId.isNotEmpty && mobile.isNotEmpty) {
        loadingBloc.add(LoadingEventShow());
      }

      if (custIdError || mobileError) {
        Fluttertoast.showToast(msg: "All Field is required!");
        return;
      }

      loginOTPBloc.add(LoginOtpEvent(SendCodeParam(
          uniqe_id: Constants.uniqueId, mobile: mobile, custId: custId)));
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
                if (state.isLoading == false) {
                  loadingBloc.add(LoadingEventHide());
                }
                if (state.isSendCodeSuccess == true) {
                  final param = CheckLoginCodeParam(
                      uniqe_id: Constants.uniqueId, mobile: mobile);
                  context.navigate(Routes.inputOtp, arg: param);
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
                        focusNode: _focusNode[0],
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
                        focusNode: _focusNode[1],
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

                    SizedBox(
                      width: widget.textFieldwidth - 20,
                      child: const Text(
                          "בהתחברות שלי לאפליקציה אני מאשר את תנאי השימוש ואת מדיניות הפרטיות של האפליקציה",
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
                          "התחברות",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          buttonClickFunction();
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

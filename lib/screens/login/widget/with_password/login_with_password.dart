import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottonet/blocs/loading/loading_bloc.dart';
import 'package:lottonet/blocs/loading/loading_event.dart';
import 'package:lottonet/blocs/login_with_password/login_password_bloc.dart';
import 'package:lottonet/blocs/login_with_password/login_password_event.dart';
import 'package:lottonet/blocs/login_with_password/login_password_state.dart';
import 'package:lottonet/models/login_password/login_password_param.dart';
import 'package:lottonet/screens/login/widget/rounded_text_field.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/navigation_ext.dart';
import 'package:lottonet/utils/routes.dart';

class LoginWithPassword extends StatefulWidget {
  final double textFieldheight;
  final double textFieldwidth;

  const LoginWithPassword(
      {super.key, required this.textFieldheight, required this.textFieldwidth});

  @override
  State<StatefulWidget> createState() => _LoginWithPasswordState();
}

class _LoginWithPasswordState extends State<LoginWithPassword> {
  bool showCodeTextField = false;
  String custId = "";
  String mobile = "";
  String password = "";
  bool custIdError = false;
  bool mobileError = false;
  bool passwordError = false;

  @override
  Widget build(BuildContext context) {
    final loadingBloc = context.read<LoadingBloc>();
    final loginPasswordBloc = context.read<LoginPasswordBloc>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0), // Add padding for better spacing
              child: BlocConsumer<LoginPasswordBloc, LoginPasswordState>(
                  listener: (context, state) {
                if (state.isLoading == false)
                  loadingBloc.add(LoadingEventHide());
                if (state.response?.result == 0) {
                  context.navigateAndFinish(Routes.mainScreen);
                }
              }, builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    //Identity card
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
                    // Password
                    SizedBox(
                      height: widget.textFieldheight,
                      width: widget.textFieldwidth,
                      child: RoundedTextField(
                        "סיסמא",
                        true,
                        passwordError,
                        isDigitOnly: false,
                        onTextChange: (it) {
                          if (it.isNotEmpty && passwordError) {
                            setState(() {
                              passwordError = false;
                            });
                          }
                          password = it;
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
                          setState(() {
                            custIdError = custId.isEmpty;
                            passwordError = password.isEmpty;
                          });

                          if (custIdError || passwordError) {
                            Fluttertoast.showToast(
                                msg: "All fields is required!");
                            return;
                          }

                          loadingBloc.add(LoadingEventShow());
                          loginPasswordBloc.add(LoginPasswordEvent(
                              LoginPasswordParam(
                                  custId: custId,
                                  password: password,
                                  uniqe_id: Constants.uniqueId)));
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
                              style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline)),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_bloc.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_event.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_state.dart';
import 'package:lottonet/blocs/login_with_password/login_password_bloc.dart';
import 'package:lottonet/blocs/login_with_password/login_password_event.dart';
import 'package:lottonet/blocs/login_with_password/login_password_state.dart';
import 'package:lottonet/models/login_otp/send_code/send_code_param.dart';
import 'package:lottonet/models/login_password/login_password_param.dart';
import 'package:lottonet/screens/login/widget/rounded_text_field.dart';

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

  @override
  Widget build(BuildContext context) {
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
              child: BlocBuilder<LoginPasswordBloc, LoginPasswordState>(
                  builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    SizedBox(
                      height: widget.textFieldheight,
                      width: widget.textFieldwidth,
                      child: RoundedTextField(
                        "תעודת זהות",
                        false,
                        onTextChange: (it) {
                          custId = it;
                        },
                      ), //Identity card
                    ),
                    SizedBox(
                      height: widget.textFieldheight,
                      width: widget.textFieldwidth,
                      child: RoundedTextField(
                        "טלפו",
                        true,
                        onTextChange: (it) {
                          password = it;
                        },
                      ), // Password
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
                          loginPasswordBloc.add(LoginPasswordEvent(
                              LoginPasswordParam(
                                  custId: custId,
                                  password: password,
                                  uniqe_id:
                                      "ffc22d20-d7db-11ef-97aa-5b10ceba786f")));
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

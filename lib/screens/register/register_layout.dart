import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottonet/blocs/register/register_bloc.dart';
import 'package:lottonet/blocs/register/register_event.dart';
import 'package:lottonet/blocs/register/register_state.dart';
import 'package:lottonet/models/register/register_user_param.dart';
import 'package:lottonet/screens/login/widget/background_image_screen.dart';
import 'package:lottonet/screens/login/widget/rounded_text_field.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/navigation_ext.dart';

class RegisterLayout extends StatefulWidget {
  const RegisterLayout({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterLayoutState();
}

class _RegisterLayoutState extends State<RegisterLayout> {
  String custId = '';
  String firstName = '';
  String lastName = '';
  int age = -1;
  String mobile = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final baseSize = MediaQuery.of(context).size;
    final registerBloc = context.read<RegisterBloc>();

    return Stack(
      children: [
        const BackgroundImageScreen(),
        Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: SizedBox(
                    height: baseSize.height * 0.9,
                    width: baseSize.width * 0.9,
                    child: BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            SizedBox(height: baseSize.height * 0.05),
                            // Logo
                            Image.asset(
                              '${Constants.imagePath}/main_logo.png',
                              width: baseSize.width * 0.7,
                              height: baseSize.height * 0.13,
                            ),

                            Expanded(
                                child: SingleChildScrollView(
                                    child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  // ID
                                  SizedBox(
                                    height: baseSize.height * .09,
                                    width: baseSize.width * .8,
                                    child: RoundedTextField(
                                      "תעודת זהות",
                                      false,
                                      onTextChange: (it) {
                                        custId = it;
                                      },
                                    ),
                                  ),
                                  // First Name
                                  SizedBox(
                                    height: baseSize.height * .09,
                                    width: baseSize.width * .8,
                                    child: RoundedTextField(
                                      "שם",
                                      false,
                                      onTextChange: (it) {
                                        firstName = it;
                                      },
                                    ),
                                  ),
                                  // Last Name
                                  SizedBox(
                                    height: baseSize.height * .09,
                                    width: baseSize.width * .8,
                                    child: RoundedTextField(
                                      "שם משפחה",
                                      false,
                                      onTextChange: (it) {
                                        lastName = it;
                                      },
                                    ),
                                  ),
                                  //Age
                                  SizedBox(
                                    height: baseSize.height * .09,
                                    width: baseSize.width * .8,
                                    child: RoundedTextField(
                                      "גיל",
                                      false,
                                      onTextChange: (it) {
                                        age = int.parse(it);
                                      },
                                    ),
                                  ),
                                  // Mobile Phone
                                  SizedBox(
                                    height: baseSize.height * .09,
                                    width: baseSize.width * .8,
                                    child: RoundedTextField(
                                      "טלפון נייד",
                                      false,
                                      onTextChange: (it) {
                                        mobile = it;
                                      },
                                    ),
                                  ),
                                  // Password
                                  SizedBox(
                                    height: baseSize.height * .09,
                                    width: baseSize.width * .8,
                                    child: RoundedTextField(
                                      "סיסמא",
                                      true,
                                      onTextChange: (it) {
                                        password = it;
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: baseSize.width * .6,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFC71D26),
                                      ),
                                      child: const Text(
                                        "כְּנִיסָה לַמַעֲרֶכֶת",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        registerBloc.add(
                                          RegisterEvent(
                                            RegisterUserParam(
                                                custId,
                                                firstName,
                                                lastName,
                                                age,
                                                mobile,
                                                password,
                                                Constants.uniqueId),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 5),

                                  SizedBox(
                                      width: baseSize.width * .8,
                                      child: TextButton(
                                        onPressed: () {
                                          context.popBackStack();
                                        },
                                        child: const Text("מנרשמת בעבר? כניסה",
                                            textAlign: TextAlign.center,
                                            style:
                                                TextStyle(color: Colors.white)),
                                      )),
                                ],
                              ),
                            )))
                          ],
                        );
                      },
                    )),
              ),
            ))
      ],
    );
  }
}

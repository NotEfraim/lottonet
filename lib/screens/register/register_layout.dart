import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottonet/blocs/loading/loading_bloc.dart';
import 'package:lottonet/blocs/loading/loading_event.dart';
import 'package:lottonet/blocs/register/register_bloc.dart';
import 'package:lottonet/blocs/register/register_event.dart';
import 'package:lottonet/blocs/register/register_state.dart';
import 'package:lottonet/models/register/register_user_param.dart';
import 'package:lottonet/screens/login/widget/background_image_screen.dart';
import 'package:lottonet/screens/login/widget/rounded_text_field.dart';
import 'package:lottonet/screens/regulations/regulations_widget.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/navigation_ext.dart';

class RegisterLayout extends StatefulWidget {
  const RegisterLayout({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterLayoutState();
}

class _RegisterLayoutState extends State<RegisterLayout> {
  String custId = '';
  bool custIdError = false;
  String firstName = '';
  bool firstNameError = false;
  String lastName = '';
  bool lastNameError = false;
  int age = -1;
  bool ageError = false;
  String mobile = '';
  bool mobileError = false;
  String password = '';
  bool passwordError = false;
  bool ageRegulationAccepted = false;
  bool privacyRegulationAccepted = false;

  void showRegulationDialog(
      {required Function() onAccept, required String content}) {
    showDialog(
        context: context,
        builder: (context) {
          return RegulationsWidget(acceptFunction: onAccept, content: content);
        });
  }

  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.purple;
    }
    return Colors.white;
  }

  Widget buildRegulations(
      {required double width,
      required String text,
      required bool value,
      required Function(bool?) onchange}) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
                fillColor: WidgetStateColor.resolveWith(getColor),
                checkColor: Colors.purple,
                value: value,
                onChanged: (b) {
                  onchange(b);
                }),
            Text(
              maxLines: 2,
              text,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final baseSize = MediaQuery.of(context).size;
    final registerBloc = context.read<RegisterBloc>();
    final loadingBloc = context.read<LoadingBloc>();

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
                    child: BlocConsumer<RegisterBloc, RegisterState>(
                      listener: (context, state) {
                        if (state.isLoading == false) {
                          loadingBloc.add(LoadingEventHide());
                        }
                        if (state.response?.result == 0) {
                          context.popBackStack();
                        }
                      },
                      builder: (context, state) {
                        return Column(
                          children: [
                            SizedBox(
                              width: baseSize.width * .95,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      context.popBackStack();
                                    },
                                    icon: Image.asset(
                                      '${Constants.imagePath}/right_arrow.png',
                                      height: 30,
                                      width: 30,
                                      fit: BoxFit
                                          .contain, // Ensure the image scales nicely
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                            SizedBox(height: baseSize.height * 0.02),
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
                                      custIdError,
                                      isDigitOnly: false,
                                      onTextChange: (it) {
                                        if (it.isNotEmpty && custIdError) {
                                          custIdError = false;
                                        }
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
                                      firstNameError,
                                      isDigitOnly: false,
                                      onTextChange: (it) {
                                        if (it.isNotEmpty && firstNameError) {
                                          setState(() {
                                            firstNameError = false;
                                          });
                                        }
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
                                      lastNameError,
                                      isDigitOnly: false,
                                      onTextChange: (it) {
                                        if (it.isNotEmpty && lastNameError) {
                                          setState(() {
                                            lastNameError = false;
                                          });
                                        }
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
                                      ageError,
                                      isDigitOnly: true,
                                      onTextChange: (it) {
                                        if (it.isNotEmpty && ageError) {
                                          setState(() {
                                            ageError = false;
                                          });
                                        }
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
                                  // Password
                                  SizedBox(
                                    height: baseSize.height * .09,
                                    width: baseSize.width * .8,
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

                                  buildRegulations(
                                      width: baseSize.width * 8,
                                      text:
                                          " אני מאשר את התקנון, תנאי השימוש ושאני מעל גיל 18",
                                      value: ageRegulationAccepted,
                                      onchange: (b) {
                                        showRegulationDialog(
                                            onAccept: () {
                                              setState(() {
                                                ageRegulationAccepted = true;
                                              });
                                            },
                                            content:
                                                Constants.ageRegulationContent);
                                      }),

                                  buildRegulations(
                                      width: baseSize.width * 8,
                                      text: " אני מאשר לקבל עדכונים ",
                                      value: privacyRegulationAccepted,
                                      onchange: (b) {
                                        showRegulationDialog(
                                            onAccept: () {
                                              setState(() {
                                                privacyRegulationAccepted =
                                                    true;
                                              });
                                            },
                                            content: Constants
                                                .privacyRegulationText);
                                      }),

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
                                        if (!privacyRegulationAccepted ||
                                            !ageRegulationAccepted) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  'תחילה עליך לקבל את התנאים וההגבלות!');
                                          return;
                                        }

                                        setState(() {
                                          custIdError = custId.isEmpty;
                                          firstNameError = firstName.isEmpty;
                                          lastNameError = lastName.isEmpty;
                                          ageError = (age.toString()).isEmpty ||
                                              age == -1;
                                          mobileError = mobile.isEmpty;
                                          passwordError = password.isEmpty;
                                        });

                                        if (custIdError ||
                                            firstNameError ||
                                            lastNameError ||
                                            ageError ||
                                            mobileError ||
                                            passwordError) {
                                          Fluttertoast.showToast(
                                              msg: "All fields is required!");
                                          return;
                                        }

                                        loadingBloc.add(LoadingEventShow());
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

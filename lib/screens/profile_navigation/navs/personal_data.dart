import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottonet/blocs/loading/loading_bloc.dart';
import 'package:lottonet/blocs/loading/loading_event.dart';
import 'package:lottonet/blocs/profile/get_customer/get_customer_data_bloc.dart';
import 'package:lottonet/blocs/profile/get_customer/get_customer_event.dart';
import 'package:lottonet/blocs/profile/get_customer/get_customer_state.dart';
import 'package:lottonet/blocs/profile/update_customer/update_customer_bloc.dart';
import 'package:lottonet/blocs/profile/update_customer/update_customer_event.dart';
import 'package:lottonet/blocs/profile/update_customer/update_customer_state.dart';
import 'package:lottonet/models/profile/get_customer_data_response.dart';
import 'package:lottonet/models/profile/update_customer_param.dart';
import 'package:lottonet/screens/login/widget/rounded_text_field.dart';
import 'package:lottonet/screens/widget_utils/common_app_bar.dart';
import 'package:lottonet/screens/widget_utils/widget_exrensions.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/navigation_ext.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  final _controller = List.generate(5, (index) => TextEditingController());
  bool showDim = false;
  bool showButton = false;
  String emailTxt = '';
  String fullNameTxt = '';
  String ageTxt = '';
  String custIdTxt = '';
  String mobileTxt = '';

  Widget buildMenuItem(String text, Function() onClick) {
    return SizedBox(
      height: 30, // Set height of the TextButton
      child: TextButton(
        onPressed: () {
          setState(() {
            showDim = false;
          });
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero, // Remove any default padding
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14), // Optional: style for text
        ),
      ),
    );
  }

  bool validateButton(GetCustomerDataResponse? data) {
    return emailTxt != '${data?.email}' ||
        fullNameTxt != '${data?.fullName}' ||
        ageTxt != '${data?.age}' ||
        custIdTxt != '${data?.custId}' ||
        mobileTxt != '${data?.mobile}';
  }

  Widget buildInputFields(
      {required TextEditingController controller,
      required GetCustomerState state,
      required Size baseSize,
      required String label,
      required bool isError,
      required bool digitsOnly,
      required String defaultValue,
      required Function(String) onChange}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 16,
          padding: const EdgeInsets.only(right: 20),
          width: double.infinity,
          child: Text(
            label,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        SizedBox(
          width: baseSize.width * .9,
          height: baseSize.height * .08,
          child: RoundedTextField(defaultValue, false, isError,
              controller: controller, onTextChange: (s) {
            onChange(s);
            setState(() {
              showButton = validateButton(state.response);
            });
          }, isDigitOnly: digitsOnly),
        )
      ],
    );
  }

  Widget buildBalance(String balance) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align children vertically at the start
          crossAxisAlignment: CrossAxisAlignment
              .end, // Align children horizontally at the start
          children: [
            GestureDetector(
              onTap: () {
                // Handle your tap action here
                setState(() {
                  showDim = !showDim;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF282665),
                      Color(0xff3D3A9A),
                    ],
                  ),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: IntrinsicWidth(
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // Prevents extra space
                        children: [
                          Text(
                            '₪ $balance ',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const Text(
                            'יתרה',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            if (showDim)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Align text to the end (right)
                    children: [
                      buildMenuItem("היסטורית משיכות מיתרה", () {}),
                      buildMenuItem("היסטורית ההפקדות", () {}),
                      buildMenuItem("היסטורית שליחת טפסים", () {})
                    ],
                  ),
                ),
              ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    final loadingBloc = context.read<LoadingBloc>();
    loadingBloc.add(LoadingEventShow());
    final getCustomerDataBloc = context.read<GetCustomerDataBloc>();
    getCustomerDataBloc.add(GetCustomerEvent());
  }

  @override
  Widget build(BuildContext context) {
    final getCustomerDataBloc = context.read<GetCustomerDataBloc>();
    final loadingBloc = context.read<LoadingBloc>();
    final updateCustomerBloc = context.read<UpdateCustomerBloc>();
    final baseSize = MediaQuery.of(context).size;
    return BlocConsumer<GetCustomerDataBloc, GetCustomerState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(36, 13, 83, 0.88),
          appBar: PreferredSize(
              preferredSize: const Size(40, 40),
              child: CommonAppBar(
                title: "אזור אישי",
                backgroundColor: Colors.transparent,
                rightIcon: IconButton(
                    onPressed: () {
                      context.popBackStack();
                    },
                    icon: Image.asset(
                      '${Constants.imagePath}/right_arrow.png',
                    )),
              )),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: baseSize.width * .8,
                    height: baseSize.height * .7,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset(
                            '${Constants.imagePath}/profile_image.png',
                            height: baseSize.width * .4,
                            width: baseSize.width * .4,
                          ),
                          buildInputFields(
                              controller: _controller[0],
                              state: state,
                              baseSize: baseSize,
                              label: 'דואר אלקטרוני:',
                              isError: false,
                              digitsOnly: false,
                              defaultValue: state.response?.email ?? '',
                              onChange: (s) {
                                emailTxt = s;
                                if (s.isEmpty) {
                                  emailTxt = '${state.response?.email}';
                                }
                              }),
                          buildInputFields(
                              controller: _controller[1],
                              state: state,
                              baseSize: baseSize,
                              label: 'שם מלא:',
                              isError: false,
                              digitsOnly: false,
                              defaultValue: state.response?.fullName ?? '',
                              onChange: (s) {
                                fullNameTxt = s;
                                if (s.isEmpty) {
                                  fullNameTxt = '${state.response?.fullName}';
                                }
                              }),
                          buildInputFields(
                              controller: _controller[2],
                              state: state,
                              baseSize: baseSize,
                              label: 'גיל:',
                              isError: false,
                              digitsOnly: true,
                              defaultValue:
                                  state.response?.age.toString() ?? '',
                              onChange: (s) {
                                ageTxt = s;
                                if (s.isEmpty) {
                                  ageTxt = '${state.response?.age}';
                                }
                              }),
                          buildInputFields(
                              controller: _controller[3],
                              state: state,
                              baseSize: baseSize,
                              label: 'טלפון נייד:',
                              isError: false,
                              digitsOnly: true,
                              defaultValue: state.response?.mobile ?? '',
                              onChange: (s) {
                                mobileTxt = s;
                                if (s.isEmpty) {
                                  mobileTxt = '${state.response?.mobile}';
                                }
                              }),
                          buildInputFields(
                              controller: _controller[4],
                              state: state,
                              baseSize: baseSize,
                              label: 'תעודת זהות:',
                              isError: false,
                              digitsOnly: true,
                              defaultValue: state.response?.custId ?? '',
                              onChange: (s) {
                                custIdTxt = s;
                                if (s.isEmpty) {
                                  custIdTxt = '${state.response?.custId}';
                                }
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          if (showButton)
                            commonRoundedButton(
                              width: baseSize.width * .4,
                              backgroundColor: const Color(0xffC71D26),
                              textColor: Colors.white,
                              text: 'עדכון',
                              onClick: () {
                                loadingBloc.add(LoadingEventShow());
                                updateCustomerBloc.add(
                                  UpdateCustomerEvent(
                                    UpdateCustomerParam(
                                        fullName: fullNameTxt,
                                        custId: custIdTxt,
                                        mobile: mobileTxt,
                                        age: int.parse(ageTxt),
                                        email: emailTxt),
                                  ),
                                );
                              },
                            ),
                          BlocConsumer<UpdateCustomerBloc, UpdateCustomerState>(
                            builder: (context, state) {
                              return const SizedBox.shrink();
                            },
                            listener: (context, state) {
                              if (state.isLoading == false) {
                                loadingBloc.add(LoadingEventHide());
                              }
                              if (state.response?.result == 0) {
                                for (var c in _controller) {
                                  c.clear();
                                }
                                loadingBloc.add(LoadingEventShow());
                                getCustomerDataBloc.add(GetCustomerEvent());
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: buildBalance(state.response?.balance.toString() ?? ''),
                )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state.isLoading == false) loadingBloc.add(LoadingEventHide());

        final data = state.response;
        emailTxt = '${data?.email}';
        fullNameTxt = '${data?.fullName}';
        ageTxt = '${data?.age}';
        custIdTxt = '${data?.custId}';
        mobileTxt = '${data?.mobile}';
      },
    );
  }
}

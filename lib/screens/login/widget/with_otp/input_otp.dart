import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_bloc.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_event.dart';
import 'package:lottonet/blocs/login_with_otp/login_otp_state.dart';
import 'package:lottonet/models/login_otp/check_login_code/check_login_code_param.dart';
import 'package:lottonet/screens/login/widget/background_image_screen.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/navigation_ext.dart';

class InputOtp extends StatefulWidget {
  const InputOtp({super.key});

  @override
  State<StatefulWidget> createState() => _InputOtpState();
}

class _InputOtpState extends State<InputOtp> {
  final List<FocusNode> _focusNode = List.generate(5, (index) => FocusNode());
  int currentFocusedIndex = 0;

  Widget buildPin(int index, Function(String) onValueChanged) {
    return Expanded(
      flex: 1,
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        focusNode: _focusNode[index],
        maxLines: 1,
        maxLength: 1,
        cursorColor: Colors.white,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: const InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white), // Set the underline color to white
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white), // White underline when not focused
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white), // White underline when focused
            ),
            counterText: ''),
        onChanged: (value) {
          onValueChanged(value);
          if (value.isNotEmpty && currentFocusedIndex < _focusNode.length - 1) {
            currentFocusedIndex++;
          }
          if (value.isEmpty && currentFocusedIndex > 0) {
            currentFocusedIndex--;
          }
          FocusScope.of(context).requestFocus(_focusNode[currentFocusedIndex]);
        },
      ),
    );
  }

  Widget buildPinField({
    required Function(String) onPin1Change,
    required Function(String) onPin2Change,
    required Function(String) onPin3Change,
    required Function(String) onPin4Change,
    required Function(String) onPin5Change,
  }) {
    return Row(children: [
      const SizedBox(width: 5),
      buildPin(0, onPin1Change),
      const SizedBox(width: 5),
      buildPin(1, onPin2Change),
      const SizedBox(width: 5),
      buildPin(2, onPin3Change),
      const SizedBox(width: 5),
      buildPin(3, onPin4Change),
      const SizedBox(width: 5),
      buildPin(4, onPin5Change),
    ]);
  }

  void checkCodeApi(String code) {
    final loginOtpBloc = context.read<LoginOtpBloc>();
    final args = ModalRoute.of(context)?.settings.arguments;
    print('ObjX $args');
    if(args == null) return;
    // final uniqe_id = args.uniqe_id;
    // final mobile = args.mobile;
    // loginOtpBloc.add(CheckLoginCodeEvent(
    //     CheckLoginCodeParam(mobile: mobile, uniqe_id: uniqe_id, code: code)));
  }

  @override
  void dispose() {
    super.dispose();
    for (var node in _focusNode) {
      node.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final baseSize = MediaQuery.of(context).size;
    final loginOtpBloc = context.read<LoginOtpBloc>();
        final args = context.getArgument();
    print('ObjX $args');

    return BlocConsumer<LoginOtpBloc, LoginOtpState>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Stack(
              children: [
                const BackgroundImageScreen(),
                Scaffold(
                    backgroundColor: Colors.transparent,
                    body: SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: baseSize.height * 0.15),
                            // Logo
                            Image.asset(
                              '${Constants.imagePath}/main_logo.png',
                              width: baseSize.width * 0.7,
                              height: baseSize.height * 0.13,
                            ),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              width: baseSize.width * .9,
                              decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(80),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 20),
                                    const Text(
                                      "הודעת sms שמכילה קוד אימות נשלחה לנייד שלך שמספרו 05X-XXXX120",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                    const SizedBox(height: 20),
                                    buildPinField(
                                      onPin1Change: (value) =>
                                          loginOtpBloc.add(UpdatePin(0, value)),
                                      onPin2Change: (value) =>
                                          loginOtpBloc.add(UpdatePin(1, value)),
                                      onPin3Change: (value) =>
                                          loginOtpBloc.add(UpdatePin(2, value)),
                                      onPin4Change: (value) =>
                                          loginOtpBloc.add(UpdatePin(3, value)),
                                      onPin5Change: (value) =>
                                          loginOtpBloc.add(UpdatePin(4, value)),
                                    ),
                                    const SizedBox(height: 20),
                                    Container(
                                      alignment: Alignment.topRight,
                                      width: double.infinity,
                                      child: const Text(
                                        "הקוד הינו חד פעמי ותקף ל3- דקות",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ]),
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              width: baseSize.width * .9,
                              child: const Text(
                                  "בהתחברות שלי לאפליקציה אני מאשר אתתנאי השימוש ומדיניות הפרטיות שלהאפליקציה",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white)),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: baseSize.width * .6,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFC71D26),
                                ),
                                child: const Text(
                                  "כְּנִיסָה לַמַעֲרֶכֶת",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  final pinCode = state.pinList?.join("") ?? "";
                                  checkCodeApi(pinCode);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}

import 'package:flutter/material.dart';
import 'package:lottonet/screens/login/login_layout.dart';
import 'package:lottonet/screens/login/widget/background_image_screen.dart';
import 'package:lottonet/screens/login/widget/rounded_text_field.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/navigation_ext.dart';

class RegisterLayout extends StatelessWidget {
  const RegisterLayout({super.key});
  @override
  Widget build(BuildContext context) {
    final baseSize = MediaQuery.of(context).size;

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
                  child: Column(
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
                                onTextChange: (it) {},
                              ),
                            ),
                            // NAME
                            SizedBox(
                              height: baseSize.height * .09,
                              width: baseSize.width * .8,
                              child: RoundedTextField(
                                "שם",
                                false,
                                onTextChange: (it) {},
                              ),
                            ),
                            // Last Name
                            SizedBox(
                              height: baseSize.height * .09,
                              width: baseSize.width * .8,
                              child: RoundedTextField(
                                "שם משפחה",
                                false,
                                onTextChange: (it) {},
                              ),
                            ),
                            //Age
                            SizedBox(
                              height: baseSize.height * .09,
                              width: baseSize.width * .8,
                              child: RoundedTextField(
                                "גיל",
                                false,
                                onTextChange: (it) {},
                              ),
                            ),
                            // Mobile Phone
                            SizedBox(
                              height: baseSize.height * .09,
                              width: baseSize.width * .8,
                              child: RoundedTextField(
                                "טלפון נייד",
                                false,
                                onTextChange: (it) {},
                              ),
                            ),
                            // Password
                            SizedBox(
                              height: baseSize.height * .09,
                              width: baseSize.width * .8,
                              child: RoundedTextField(
                                "סיסמא",
                                true,
                                onTextChange: (it) {},
                              ),
                            ),
                            const SizedBox(height: 20),
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
                                onPressed: () {},
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
                                      style: TextStyle(color: Colors.white)),
                                )),
                          ],
                        ),
                      )))
                    ],
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

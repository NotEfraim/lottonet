import 'package:flutter/material.dart';
import 'package:lottonet/screens/login/widget/rounded_text_field.dart';

class LoginWithOtp extends StatelessWidget {
  final double textFieldheight;
  final double textFieldwidth;

  const LoginWithOtp({
    super.key,
    required this.textFieldheight,
    required this.textFieldwidth,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          // Wrap the content in a scroll view
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0), // Add padding for better spacing
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    height: textFieldheight,
                    width: textFieldwidth,
                    child: const RoundedTextField("שם משתמש  או אימייל", false),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: textFieldheight,
                    width: textFieldwidth,
                    child: const RoundedTextField("סיסמא חד פעמית", false),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: textFieldwidth - 20,
                    child: const Text("שכחתי סיסמה",
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: textFieldwidth - 20,
                    child: const Text(
                        "בהתחברות שלי לאפליקציה אני מאשר אתתנאי השימוש ומדיניות הפרטיות שלהאפליקציה",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: textFieldwidth * .6,
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
                  const SizedBox(height: 20),
                  SizedBox(
                    width: textFieldwidth,
                    child: const Text("משתמש חדש? הרשם כאן",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

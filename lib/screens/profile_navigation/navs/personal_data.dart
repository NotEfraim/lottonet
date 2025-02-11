import 'package:flutter/material.dart';
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
  bool showDim = false;

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

  Widget buildInputFields(
      {required Size baseSize,
      required String label,
      required bool isError,
      required bool digitsOnly,
      required String defaultValue}) {
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
              onTextChange: (s) {}, isDigitOnly: digitsOnly),
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
  Widget build(BuildContext context) {
    final baseSize = MediaQuery.of(context).size;
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
                          baseSize: baseSize,
                          label: 'שם מלא:',
                          isError: false,
                          digitsOnly: false,
                          defaultValue: ''),
                      buildInputFields(
                          baseSize: baseSize,
                          label: 'שם משפחה:',
                          isError: false,
                          digitsOnly: false,
                          defaultValue: ''),
                      buildInputFields(
                          baseSize: baseSize,
                          label: 'גיל:',
                          isError: false,
                          digitsOnly: false,
                          defaultValue: ''),
                      buildInputFields(
                          baseSize: baseSize,
                          label: 'טלפון נייד:',
                          isError: false,
                          digitsOnly: false,
                          defaultValue: ''),
                      buildInputFields(
                          baseSize: baseSize,
                          label: 'תעודת זהות:',
                          isError: false,
                          digitsOnly: false,
                          defaultValue: ''),
                      const SizedBox(
                        height: 20,
                      ),
                      commonRoundedButton(
                          width: baseSize.width * .4,
                          backgroundColor: const Color(0xffC71D26),
                          textColor: Colors.white,
                          text: 'בצע תשלום',
                          onClick: () {})
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: buildBalance("200"),
            )
          ],
        ),
      ),
    );
  }
}

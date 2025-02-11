import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottonet/main.dart';
import 'package:lottonet/screens/widget_utils/common_app_bar.dart';
import 'package:lottonet/screens/widget_utils/widget_exrensions.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/navigation_ext.dart';
import 'package:lottonet/utils/routes.dart';
import 'package:lottonet/utils/shared_pref.dart';

class ProfileNavigation extends StatelessWidget {
  const ProfileNavigation({super.key});

  Future<void> logout(BuildContext context) async {
    saveData(Constants.tokenKey, '');
    activeToken = '';
    Fluttertoast.showToast(msg: 'Logged out');
    context.pushRemoveAll(Routes.login);
  }

  Widget buildNavigation(String text, {Function()? onClick}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: GestureDetector(
        onTap: () {
          if (onClick != null) onClick();
        },
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  '${Constants.imagePath}/left_arrow.png',
                  height: 35,
                  width: 25,
                ),
                const Spacer(),
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
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
                    height: 35,
                    width: 25,
                  )),
            )),
        body: Center(
          child: SizedBox(
            width: baseSize.width * .9,
            height: baseSize.height * 0.7,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildNavigation('נתונים אישיים', onClick: () {
                    context.navigate(Routes.personalData);
                  }),
                  buildNavigation('אמצעי תשלום'),
                  buildNavigation('משיכת יתרה'),
                  buildNavigation('הפקדת כסף ליתרה'),
                  buildNavigation('מימוש שובר'),
                  SizedBox(height: baseSize.height * .1),
                  commonRoundedButton(
                      width: baseSize.width * .6,
                      backgroundColor: const Color(0xFF388B45),
                      textColor: Colors.white,
                      text: 'התנתק',
                      onClick: () {
                        logout(context);
                      })
                ],
              ),
            ),
          ),
        ));
  }
}

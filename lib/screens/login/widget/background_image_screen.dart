import 'package:flutter/material.dart';
import 'package:lottonet/utils/constants.dart';

class BackgroundImageScreen extends StatelessWidget {
  final Widget? content;

  const BackgroundImageScreen({super.key, this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('${Constants.imagePath}/home_background.png'),
                  fit: BoxFit.fill)),
          child: content,
        ));
  }
}

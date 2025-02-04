import 'package:flutter/material.dart';
import 'package:lottonet/screens/login/widget/background_image_screen.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/extensions.dart';
import 'package:lottonet/utils/navigation_ext.dart';
import 'package:lottonet/utils/routes.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getResources(BuildContext context) async {
  showLoading(context);
  
  try {
    await Future.delayed(const Duration(seconds: 3)); // Simulate resource loading
  } finally {
    hideLoading(context);
  }

  await Future.delayed(const Duration(seconds: 1)); // Allow UI to update before navigating
  if (context.mounted) {
    context.navigateAndFinish(Routes.login);
  }
}


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getResources(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final baseSize = MediaQuery.of(context).size;
    return Expanded(
      child: Stack(
        children: [
          const BackgroundImageScreen(),
          Center(
            child: Column(
              children: [
                SizedBox(height: baseSize.height * 0.20),
                // Logo
                Image.asset(
                  '${Constants.imagePath}/main_logo.png',
                  width: baseSize.width * 0.7,
                  height: baseSize.height * 0.13,
                ),

                SizedBox(height: baseSize.height * 0.4),

                const Text(
                  'בודק משאבים...',
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

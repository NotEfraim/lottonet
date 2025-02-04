import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottonet/blocs/loading/loading_bloc.dart';
import 'package:lottonet/blocs/loading/loading_event.dart';
import 'package:lottonet/blocs/loading/loading_state.dart';
import 'package:lottonet/main.dart';
import 'package:lottonet/screens/login/widget/background_image_screen.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/extensions.dart';
import 'package:lottonet/utils/navigation_ext.dart';
import 'package:lottonet/utils/routes.dart';
import 'package:lottonet/utils/shared_pref.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  String tokenStatus = '';

  Future<void> getResources(BuildContext context) async {
    final loadingBloc = context.read<LoadingBloc>();

    showLoading(context);
    final data = await getData<String>(Constants.tokenKey);
    activeToken = '$data';
    loadingBloc.add(LoadingEvent());
    await Future.delayed(Duration(seconds: 2));
    context.navigateAndFinish(Routes.login);
    
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

    return Scaffold(body: BlocBuilder<LoadingBloc, LoadingState>(
      builder: (_, state) {

        if(state.isLoading == false) {
          hideLoading(context);
        }

        return Stack(
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
        );
      },
    ));
  }
}

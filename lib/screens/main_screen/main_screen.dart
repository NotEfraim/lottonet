import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottonet/blocs/loading/loading_bloc.dart';
import 'package:lottonet/blocs/loading/loading_event.dart';
import 'package:lottonet/blocs/main_screen/main_screen_bloc.dart';
import 'package:lottonet/blocs/main_screen/main_screen_event.dart';
import 'package:lottonet/blocs/main_screen/main_screen_state.dart';
import 'package:lottonet/main.dart';
import 'package:lottonet/models/game_card/game_card_model.dart';
import 'package:lottonet/screens/login/widget/background_image_screen.dart';
import 'package:lottonet/screens/main_screen/game_card.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/extensions.dart';
import 'package:lottonet/utils/navigation_ext.dart';
import 'package:lottonet/utils/routes.dart';
import 'package:lottonet/utils/shared_pref.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Duration getRemainingTime(String time) {
    final targetDate = DateTime.parse(time);
    final currentDate = DateTime.now();

    // If the target date is after the current date, return the difference
    if (targetDate.isAfter(currentDate)) {
      return targetDate.difference(currentDate);
    }

    // If the target date is in the past or the same, return Duration.zero
    return Duration.zero;
  }

  Future<void> logout() async {
    saveData(Constants.tokenKey, '');
  }

  Widget buildGameCards(MainScreenState state) {
    if (state.response == null) return Container();
    return // Wrap GameCards inside SingleChildScrollView to make them scrollable
        Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GameCard(
                GameCardModel(
                    prize: '${state.response?.data.lottoPrise}',
                    day: 'בשבת עד',
                    gameName: 'לוטו',
                    duration:
                        getRemainingTime(state.response?.data.lottoDate ?? '')),
                cardColor: const Color(0xffC71D26),
                sideIcon: '/lottery_card_side_icon.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GameCard(
                GameCardModel(
                    prize: '${state.response?.data.prise777}',
                    day: 'כל שעתיים עד',
                    gameName: '777',
                    duration:
                        getRemainingTime(state.response?.data.date777 ?? '')),
                cardColor: const Color(0xffC8358F),
                sideIcon: '/77_card_side_icon.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GameCard(
                GameCardModel(
                    prize: '${state.response?.data.prise123}',
                    day: 'פעמים ביום עד',
                    gameName: 'לוטו',
                    duration:
                        getRemainingTime(state.response?.data.date123 ?? '')),
                cardColor: const Color(0xffE46720),
                sideIcon: '/123_card_side_icon.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GameCard(
                GameCardModel(
                    prize: '${state.response?.data.chancePrise}',
                    day: 'כל שעתיים עד',
                    gameName: 'צאנס',
                    duration: getRemainingTime(
                        state.response?.data.chanceDate ?? '')),
                cardColor: const Color(0xff73CC39),
                sideIcon: '/chance_card_side_icon.png',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    final mainScreenBloc = context.read<MainScreenBloc>();
    final loadingBloc = context.read<LoadingBloc>();
    loadingBloc.add(LoadingEventShow());
    mainScreenBloc.add(MainScreenEvent());
  }

  @override
  Widget build(BuildContext context) {
    final loadingBloc = context.read<LoadingBloc>();
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImageScreen(),
          SafeArea(
              child: BlocConsumer<MainScreenBloc, MainScreenState>(
                  builder: (context, state) {
                    final balance = state.response?.balance.toCurrency();
                    return Column(
                      children: [
                        const SizedBox(height: 20), // Fixed spacing
                        // Header Row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFF282665),
                                        Color(0xff3D3A9A)
                                      ],
                                    ),
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                  ),
                                  child: Center(
                                      child: Row(
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
                                      )
                                    ],
                                  ))),
                              const Spacer(), // Use Spacer to push icon to the right
                              IconButton(
                                icon: Image.asset(
                                  '${Constants.imagePath}/profile_icon.png',
                                  height: 40,
                                  width: 40,
                                ),
                                onPressed: () {
                                  activeToken = '';
                                  logout();
                                  Fluttertoast.showToast(msg: 'Logged out');
                                  context.pushRemoveAll(Routes.login);
                                },
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20), // Fixed spacing

                        // Logo
                        Image.asset(
                          '${Constants.imagePath}/main_logo.png',
                          width: screenSize.width * 0.7, // Responsive width
                          height: screenSize.height * 0.13, // Responsive height
                        ),

                        const SizedBox(height: 20), // Spacing for countdown

                        buildGameCards(state),

                        const SizedBox(height: 20), // Spacing for countdown

                        Container(
                          width: 200,
                          height: 45,
                          decoration: BoxDecoration(
                              color: const Color(0xff388B45),
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Row(
                              children: [
                                const Text(
                                  ' צור קשר עם שירות הלקוחות',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                                const Spacer(),
                                Image.asset(
                                  '${Constants.imagePath}/wechat_logo.png',
                                  width: 25,
                                  height: 25,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20), // Spacing for countdown
                      ],
                    );
                  },
                  listener: (context, state) => {
                        if (state.isLoading == false)
                          {loadingBloc.add(LoadingEventHide())},
                      })),
        ],
      ),
    );
  }
}

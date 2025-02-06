import 'package:flutter/material.dart';
import 'package:lottonet/models/game_card/game_card_model.dart';
import 'package:lottonet/screens/login/widget/background_image_screen.dart';
import 'package:lottonet/screens/main_screen/game_card.dart';
import 'package:lottonet/utils/constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  Widget buildGameCards() {
    return // Wrap GameCards inside SingleChildScrollView to make them scrollable
        Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GameCard(
                GameCardModel(
                    prize: '₪ 20,000,000',
                    day: 'בשבת עד',
                    gameName: 'לוטו',
                    duration: '1'),
                cardColor: const Color(0xffC71D26),
                sideIcon: '/lottery_card_side_icon.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GameCard(
                GameCardModel(
                    prize: '₪ 70,000',
                    day: 'כל שעתיים עד',
                    gameName: '777',
                    duration: '1'),
                cardColor: const Color(0xffC8358F),
                sideIcon: '/77_card_side_icon.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GameCard(
                GameCardModel(
                    prize: '₪ 120,000',
                    day: 'בשבת עד',
                    gameName: 'לוטו',
                    duration: '1'),
                cardColor: const Color(0xffE46720),
                sideIcon: '/123_card_side_icon.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GameCard(
                GameCardModel(
                    prize: '₪ 1,000,000',
                    day: 'כל שעתיים עד',
                    gameName: 'צאנס',
                    duration: '1'),
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
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImageScreen(),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20), // Fixed spacing

                // Header Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF282665), Color(0xff3D3A9A)],
                          ),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              '₪ 100,000',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'יתרה',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(), // Use Spacer to push icon to the right
                      IconButton(
                        icon: Image.asset(
                          '${Constants.imagePath}/profile_icon.png',
                          height: 40,
                          width: 40,
                        ),
                        onPressed: () {},
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

                buildGameCards(),

                const SizedBox(height: 20), // Spacing for countdown

                Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color(0xff388B45),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Row(
                      children: [
                        const Text(
                          'צור קשר עם שירות הלקוחות',
                          style: TextStyle(color: Colors.white),
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
            ),
          ),
        ],
      ),
    );
  }
}

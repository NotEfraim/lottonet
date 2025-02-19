import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottonet/blocs/loading/loading_bloc.dart';
import 'package:lottonet/blocs/loading/loading_event.dart';
import 'package:lottonet/blocs/main_screen/main_screen_bloc.dart';
import 'package:lottonet/blocs/main_screen/main_screen_event.dart';
import 'package:lottonet/blocs/main_screen/main_screen_state.dart';
import 'package:lottonet/models/game_card/game_card_model.dart';
import 'package:lottonet/screens/login/widget/background_image_screen.dart';
import 'package:lottonet/screens/main_screen/game_card.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/extensions.dart';
import 'package:lottonet/utils/navigation_ext.dart';
import 'package:lottonet/utils/routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // void openWhatsApp(String phoneNumber) async {
  //   final url = Uri.parse(
  //       "https://wa.me/$phoneNumber"); // פורמט תקין ל-WhatsApp deep link
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url, mode: LaunchMode.externalApplication);
  //   } else {
  //     print('error');
  //     throw "לא ניתן לפתוח את WhatsApp";
  //   }
  // }

  bool showDim = false;

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
                    gameName: '123',
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
                    day: 'כל שעתיים עד ',
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

  Widget buildBalance(String balance) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align children vertically at the start
          crossAxisAlignment: CrossAxisAlignment
              .start, // Align children horizontally at the start
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
                    crossAxisAlignment:
                        CrossAxisAlignment.end, // Align text to the end (right)
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

  Widget buildContents(MainScreenState state, Size screenSize) {
    return Column(
      children: [
        // Header Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Spacer(), // Use Spacer to push icon to the right
              IconButton(
                icon: Image.asset(
                  '${Constants.imagePath}/profile_icon.png',
                  height: 40,
                  width: 40,
                ),
                onPressed: () {
                  context.navigate(Routes.profileNavigation);
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

        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff388B45),
            foregroundColor: Colors.white, // צבע הטקסט
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // פינות מעוגלות
              side: const BorderSide(color: Colors.white, width: 2), // גבול לבן
            ),
          ),
          onPressed: () {
            // openWhatsApp('09974663117');
          },
          iconAlignment: IconAlignment.end,
          label: const Text(' צור קשר עם שירות הלקוחות'),
          icon: Image.asset(
            '${Constants.imagePath}/wechat_logo.png',
            width: 25,
            height: 25,
          ),
        ),

        const SizedBox(height: 20), // Spacing for countdown
      ],
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
          // if (showDim)
          //   Container(
          //     height: double.infinity,
          //     width: double.infinity,
          //     color: Colors.black.withAlpha(70),
          //   ),
          SafeArea(
            child: BlocConsumer<MainScreenBloc, MainScreenState>(
              builder: (context, state) {
                final balance = state.response?.balance.toCurrency();
                return Stack(
                  children: [
                    buildContents(state, screenSize),
                    buildBalance('$balance'),
                  ],
                );
              },
              listener: (context, state) => {
                if (state.isLoading == false)
                  {loadingBloc.add(LoadingEventHide())},
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottonet/models/game_card/game_card_model.dart';
import 'package:lottonet/screens/main_screen/custom_slide_countdown.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/extensions.dart';

class GameCard extends StatelessWidget {
  final GameCardModel model;
  final Color cardColor;
  final String sideIcon;
  const GameCard(
    this.model, {
    super.key,
    required this.cardColor,
    required this.sideIcon,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Padding to be reused
    const padding = EdgeInsets.only(left: 15, top: 10);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: cardColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            _buildTopRow(model),
            const SizedBox(height: 10),
            _buildCountdownRow(model.duration ?? const Duration(hours: 1)),
          ],
        ),
      ),
    );
  }

  Row _buildTopRow(GameCardModel data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildPrizeAmount(int.parse(data.prize ?? '0').toCurrency()),
        const Spacer(),
        Text(
          data.day ?? '',
          textAlign: TextAlign.end,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        const Spacer(),
        Text(
          data.gameName ?? '',
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }

  Container _buildPrizeAmount(String prize) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff666666), Colors.black, Colors.black],
        ),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Text(
        prize,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  Row _buildCountdownRow(Duration duration) {
    return Row(
      children: [
        CustomSlideCountdown(
          initialDuration: duration,
          onAnimationDone: () {},
        ),
        const Spacer(),
        Image.asset(
          '${Constants.imagePath}$sideIcon',
          width: 50,
          height: 50,
          fit: BoxFit.fill,
        )
      ],
    );
  }
}

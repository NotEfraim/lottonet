import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottonet/blocs/banking/banking_bloc.dart';
import 'package:lottonet/blocs/banking/banking_state.dart';
import 'package:lottonet/screens/bank/banking_widget.dart';
import 'package:lottonet/screens/login/widget/rounded_text_field.dart';
import 'package:lottonet/screens/widget_utils/common_app_bar.dart';
import 'package:lottonet/utils/color_utils.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/navigation_ext.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  int selectedPaymentTab = 0;
  String cardName = '';
  String cardNumber = '';
  String year = '';
  String month = '';
  String cvv = '';
  bool saveCard = false;
  String lastFourDigit = '';

  Widget headerItem(Size baseSize, String text,
      {required Function() onPressed}) {
    return Container(
      alignment: Alignment.centerRight,
      color: Colors.white.withAlpha(40),
      width: double.infinity,
      height: baseSize.height * .06,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildRowItem({
    required String text,
    required Color textColor,
    required Color circleColor,
    required Color borderColor,
  }) {
    return Container(
      width: double.infinity,
      color: circleColor == Colors.white
          ? Colors.white
          : const Color.fromARGB(80, 102, 102, 102),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(color: textColor, fontSize: 14),
          ),
          const Spacer(),
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
              border: Border.all(color: borderColor, width: 2),
            ),
          ),
        ],
      ),
    );
  }

  Widget redeemVoucherWidget(Size baseSize) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: RoundedTextField('קוד קופון', false, false,
                textPadding: const EdgeInsets.symmetric(horizontal: 10),
                height: baseSize.height * .06,
                onTextChange: (s) {},
                cornderRadius: 10,
                isDigitOnly: false),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 3,
            child: Container(
                decoration: BoxDecoration(
                    color: buttonGreen,
                    borderRadius: BorderRadius.circular(10)),
                height: baseSize.height * .06,
                child: const Center(
                  child: Text(
                    "לִפְדוֹת",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget buildChoosePayment(Size baseSize) {
    return Container(
      width: baseSize.width * .9,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: primaryPurple,
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: double.infinity,
            child: const Text(
              "שיטת תשלום",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),

          // Balance Row
          _buildRowItem(
            text: "יתרה נוכחית: ₪189.90",
            textColor: primaryPurple,
            circleColor: primaryPurple,
            borderColor: Colors.white,
          ),

          // Payment Method Row
          _buildRowItem(
            text: "באמצעות כרטיס אשראי",
            textColor: primaryPurple,
            circleColor: Colors.white,
            borderColor: const Color.fromARGB(80, 102, 102, 102),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final baseSize = MediaQuery.of(context).size;
    return BlocConsumer<BankingBloc, BankingState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            color: backgroundPurple,
            child: SafeArea(
                child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: const Size(40, 40),
                child: CommonAppBar(
                  title: "אישור תשלום",
                  backgroundColor: Colors.transparent,
                  leftIcon: IconButton(
                      onPressed: () {
                        context.popBackStack();
                      },
                      icon: Image.asset(
                        '${Constants.imagePath}/right_arrow.png',
                        height: 35,
                        width: 25,
                      )),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: baseSize.height * .03),
                    headerItem(baseSize, "טבלאות :", onPressed: () {}),
                    SizedBox(height: baseSize.height * .01),
                    headerItem(baseSize, "לתשלום:", onPressed: () {}),
                    SizedBox(height: baseSize.height * .02),
                    redeemVoucherWidget(baseSize),
                    SizedBox(height: baseSize.height * .01),
                    buildChoosePayment(baseSize),
                    SizedBox(height: baseSize.height * .01),
                    SizedBox(
                      width: baseSize.width,
                      height: baseSize.height * .6,
                      child: const BankingWidget(
                        amount: "100",
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

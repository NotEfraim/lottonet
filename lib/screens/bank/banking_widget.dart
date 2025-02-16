import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottonet/blocs/banking/banking_bloc.dart';
import 'package:lottonet/blocs/banking/banking_event.dart';
import 'package:lottonet/blocs/banking/banking_state.dart';
import 'package:lottonet/blocs/loading/loading_bloc.dart';
import 'package:lottonet/blocs/loading/loading_event.dart';
import 'package:lottonet/models/banking/add_card/charge_credit_card_param.dart';
import 'package:lottonet/models/banking/charge_card/charge_existing_card_param.dart';
import 'package:lottonet/screens/login/widget/rounded_text_field.dart';
import 'package:lottonet/screens/widget_utils/widget_exrensions.dart';
import 'package:lottonet/utils/color_utils.dart';
import 'package:lottonet/utils/constants.dart';
import 'package:lottonet/utils/extensions.dart';

class BankingWidget extends StatefulWidget {
  final String amount;
  const BankingWidget({super.key, required this.amount});

  @override
  State createState() => _BankingWidgetState();
}

Widget buildCheckBox(
    {required double width,
    required String text,
    required bool value,
    required Function(bool?) onchange}) {
  return Row(
    children: [
      Checkbox(
          fillColor: WidgetStateColor.resolveWith(getColor),
          checkColor: Colors.purple,
          value: value,
          onChanged: (b) {
            onchange(b);
          }),
      Text(
        maxLines: 2,
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    ],
  );
}

Color getColor(Set<WidgetState> states) {
  const Set<WidgetState> interactiveStates = <WidgetState>{
    WidgetState.pressed,
    WidgetState.hovered,
    WidgetState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.purple;
  }
  return Colors.white;
}

class _BankingWidgetState extends State<BankingWidget> {
  int currentYear = DateTime.now().year;
  int selectedIndex = 0;
  int selectedCardIndex = 0;
  bool isChecked = false;
  String cardName = '';
  String cardNumber = '';
  int selectedMonth = 1;
  int selectedYear = 2025;
  String cvv = '';
  String lastFourDigit = '';

  Color getTabColor(int index) {
    return (selectedIndex == index)
        ? const Color(0xff282665)
        : Colors.white.withAlpha(40);
  }

  Widget yearDropDown(Size baseSize) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<int>(
        value: selectedYear,
        iconEnabledColor: const Color(0xff282665),
        dropdownColor: Colors.white,
        menuMaxHeight: 200,
        onChanged: (int? newValue) {
          if (newValue != null) {
            setState(() {
              selectedYear = newValue;
            });
          }
        },
        items: List.generate(11, (index) => currentYear + index)
            .map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(
              value.toString(),
              style: const TextStyle(color: primaryPurple),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget monthDropDown(Size baseSize) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<int>(
        value: selectedMonth,
        iconEnabledColor: primaryPurple,
        dropdownColor: Colors.white,
        menuMaxHeight: 200, // Limit menu height
        onChanged: (int? newValue) {
          if (newValue != null) {
            setState(() {
              selectedMonth = newValue;
            });
          }
        },
        items: List.generate(12, (index) => index + 1)
            .map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(
              value.toString().padLeft(2, '0'), // Formats as 01, 02, ..., 12
              style: const TextStyle(color: primaryPurple),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget createTabItem(int position, String text,
      {required Function() onPressed}) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: getTabColor(position),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            side: const BorderSide(color: Colors.white, width: 1)),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget bankTab(
      {required Function() onTab1Pressed, required Function() onTab2Pressed}) {
    final baseSize = MediaQuery.of(context).size;
    return Row(
      children: [
        createTabItem(
          0,
          'כרטיס קיים',
          onPressed: () {
            onTab1Pressed();
          },
        ),
        SizedBox(
          width: baseSize.width * .02,
        ),
        createTabItem(
          1,
          'כרטיס חדש',
          onPressed: () {
            onTab2Pressed();
          },
        ),
      ],
    );
  }

  Widget buildAddCard(Size baseSize) {
    return Column(
      children: [
        SizedBox(
          width: baseSize.width,
          child: const Text(
            "פרטי אמצעי תשלום",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        RoundedTextField('השם בכרטיס', false, false,
            textPadding: const EdgeInsets.symmetric(horizontal: 10),
            height: baseSize.height * .06, onTextChange: (s) {
          cardName = s;
        }, cornderRadius: 0, isDigitOnly: false),
        RoundedTextField('מספר כרטיס', false, false,
            textPadding: const EdgeInsets.symmetric(horizontal: 10),
            height: baseSize.height * .06, onTextChange: (s) {
          cardNumber = s;
        }, cornderRadius: 0, isDigitOnly: false),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                height: baseSize.height * .06,
                width: baseSize.width * .02,
                child: Center(
                  child: yearDropDown(baseSize),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                height: baseSize.height * .06,
                width: baseSize.width * .2,
                child: Center(
                  child: monthDropDown(baseSize),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: RoundedTextField('CVV', false, false,
                  maxLength: 4,
                  height: baseSize.height * .06,
                  textPadding: const EdgeInsets.symmetric(horizontal: 10),
                  onTextChange: (s) {
                cvv = s;
              }, cornderRadius: 0, isDigitOnly: true),
            ),
          ],
        ),
        Transform.translate(
          offset: const Offset(15, 0),
          child: buildCheckBox(
            text: "שמור את הכרטיס לעסקאות עתידיות",
            width: baseSize.width,
            value: isChecked,
            onchange: (b) {
              setState(() {
                isChecked = !isChecked;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget buildDisplayCard(Size baseSize) {
    return BlocConsumer<BankingBloc, BankingState>(
      builder: (context, state) {
        return Column(children: [
          SizedBox(
            width: baseSize.width,
            child: const Text(
              "בחר כרטיס",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  state.getCreditCardsResponse?.data.length ?? 0, (index) {
                return buildDisplayBankItem(
                    selectedCardIndex == index,
                    state.getCreditCardsResponse?.data[index].lastFourDigits ??
                        '', (s) {
                  setState(() {
                    selectedCardIndex = index;
                  });
                  lastFourDigit = s;
                });
              }))
        ]);
      },
      listener: (context, state) {},
    );
  }

  Widget buildDisplayBankItem(
      bool isActive, String lastFourDigit, Function(String) onTap) {
    final backgroundColor = isActive ? Colors.white : fadedWhite;
    final textColor = isActive ? primaryPurple : Colors.white;
    final radioButton = isActive ? 'radio_active.png' : 'radio_inactive.png';

    return GestureDetector(
      onTap: () {
        onTap(lastFourDigit);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: .5)),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                '${Constants.imagePath}/$radioButton',
                width: 20,
                height: 20,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                "$lastFourDigit **** **** **** ",
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ),
            Expanded(
              flex: 1,
              child: Image.asset(
                '${Constants.imagePath}/delete_icon.png',
                width: 30,
                height: 30,
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
    final bankingBloc = context.read<BankingBloc>();
    bankingBloc.add(GetCrediCardsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final bankingBloc = context.read<BankingBloc>();
    final loadingBloc = context.read<LoadingBloc>();
    final baseSize = MediaQuery.of(context).size;
    return BlocConsumer<BankingBloc, BankingState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      bankTab(onTab1Pressed: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      }, onTab2Pressed: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      }),
                      if (selectedIndex == 0) ...[
                        const SizedBox(height: 20),
                        buildAddCard(baseSize),
                      ] else ...[
                        const SizedBox(height: 20),
                        buildDisplayCard(baseSize),
                      ],
                      SizedBox(height: baseSize.height * .03),
                      commonRoundedButton(
                        backgroundColor: const Color(0xFFC71D26),
                        width: baseSize.width * .5,
                        textColor: Colors.white,
                        text: "בצע תשלום",
                        onClick: () {
                          if (selectedIndex == 0) {
                            bankingBloc.add(
                              ChargeCreditCardEvent(
                                ChargeCreditCardParam(
                                    ownerId: '890108566',
                                    ownerName: cardName,
                                    ownerCreditCard: cardNumber,
                                    month: '$selectedMonth',
                                    year:
                                        selectedYear.toString().substring(2, 4),
                                    cvv: cvv,
                                    amount: 100,
                                    toSave: isChecked ? 1 : 0),
                              ),
                            );
                          } else {
                            bankingBloc.add(
                              ChargeExisitingCreditCardEvent(
                                ChargeExistingCardParam(
                                  lastdigits: lastFourDigit,
                                  amount: 100,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(height: baseSize.height * .03),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state.isLoading == false) {
          loadingBloc.add(LoadingEventHide());
        } else {
          loadingBloc.add(LoadingEventShow());
        }
      },
    );
  }
}

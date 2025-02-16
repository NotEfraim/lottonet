import 'package:flutter/material.dart';
import 'package:lottonet/screens/login/widget/rounded_text_field.dart';
import 'package:lottonet/screens/widget_utils/widget_exrensions.dart';
import 'package:lottonet/utils/color_utils.dart';

class BankingWidget extends StatefulWidget {
  const BankingWidget({super.key});

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
  bool isChecked = false;
  int selectedMonth = 1;
  int selectedYear = 2025;

  Color getTabColor(int index) {
    return (selectedIndex == index)
        ? const Color(0xff282665)
        : Colors.white.withAlpha(40);
  }

  Widget yearDropDown(Size BaseSize) {
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
    int selectedMonth = DateTime.now().month; // Default: Current Month
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
            height: baseSize.height * .06,
            onTextChange: (s) {},
            cornderRadius: 0,
            isDigitOnly: false),
        RoundedTextField('מספר כרטיס', false, false,
            textPadding: const EdgeInsets.symmetric(horizontal: 10),
            height: baseSize.height * .06,
            onTextChange: (s) {},
            cornderRadius: 0,
            isDigitOnly: false),
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
                  onTextChange: (s) {},
                  cornderRadius: 0,
                  isDigitOnly: true),
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
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget buildDisplayCard(Size baseSize) {
    return Column(children: [
      SizedBox(
        width: baseSize.width,
        child: const Text(
          "בחר כרטיס",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final baseSize = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  const SizedBox(height: 20),
                  if (selectedIndex == 0)
                    buildAddCard(baseSize)
                  else
                    buildDisplayCard(baseSize),
                  commonRoundedButton(
                    backgroundColor: const Color(0xFFC71D26),
                    width: baseSize.width * .5,
                    textColor: Colors.white,
                    text: "בצע תשלום",
                    onClick: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

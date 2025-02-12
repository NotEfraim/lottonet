import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottonet/utils/constants.dart';

class RoundedTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final bool isError;
  final bool isDigitOnly;
  final FocusNode? focusNode;
  final Function(String) onTextChange;

  const RoundedTextField(this.hintText, this.obscureText, this.isError,
      {super.key,
      required this.onTextChange,
      required this.isDigitOnly,
      this.controller,
      this.focusNode});

  @override
  State<StatefulWidget> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  bool isShow = false;
  String toggleImage = "password_hide.png";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.isError ? Colors.red : Colors.transparent,
                width: 1),
            color: widget.isError
                ? const Color.fromARGB(255, 241, 223, 223)
                : Colors.white,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Expanded TextField with flex 8
            Expanded(
              flex: 8,
              child: TextField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                keyboardType: widget.isDigitOnly
                    ? TextInputType.number
                    : TextInputType.text,
                inputFormatters: [
                  if (widget.isDigitOnly) FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (value) => widget.onTextChange(value),
                obscureText: isShow,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  filled: true,
                  fillColor:
                      Colors.transparent, // Ensure the fill color is consistent
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                ),
              ),
            ),
            // Expanded Image with flex 2

            if (widget.obscureText)
              Expanded(
                flex: 2,
                child: Align(
                    alignment: Alignment.center, // Align the image vertically
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isShow = !isShow;
                          toggleImage = isShow
                              ? "password_show.png"
                              : "password_hide.png";
                        });
                      },
                      icon: Image.asset(
                        '${Constants.imagePath}/$toggleImage',
                        height: 20,
                        width: 20,
                        fit: BoxFit.contain, // Ensure the image scales nicely
                      ),
                    )),
              ),
          ],
        ),
      ),
    );
  }
}

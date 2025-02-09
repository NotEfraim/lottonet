import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  final IconButton? rightIcon;
  final String title;
  final IconButton? leftIcon;
  final Color backgroundColor;
  const CommonAppBar(
      {super.key,
      this.rightIcon,
      this.leftIcon,
      required this.title,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Row(
        children: [
          Expanded(flex: 1, child: rightIcon ?? Container()),
          Expanded(
              flex: 1,
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              )),
          Expanded(flex: 1, child: rightIcon ?? Container()),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottonet/utils/navigation_ext.dart';

class RegulationsWidget extends StatelessWidget {
  final String content;
  final Function() acceptFunction;

  const RegulationsWidget({
    super.key,
    required this.acceptFunction,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final baseSize = MediaQuery.of(context).size;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: baseSize.width * 0.9,
        height: baseSize.height * 0.9,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Prevent unnecessary height
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    content,
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: baseSize.width * 0.6,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC71D26),
                ),
                onPressed: () {
                  acceptFunction();
                  context.popBackStack();
                },
                child: const Text(
                  "לְקַבֵּל",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

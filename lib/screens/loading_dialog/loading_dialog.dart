import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0,
        child: Center(
          child: LoadingAnimationWidget.inkDrop(
            color: Colors.white,
            size: 40, // Increased size for better visibility
          ),
        ),
      ),
    );
  }

  static void hide(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}

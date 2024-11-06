import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog {
  static Future<void> open(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(0.5),
      builder: (BuildContext buildContext) {
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              child: SizedBox(
                width: 250,
                height: 250,
                child: Lottie.asset(
                  "assets/images/Animation - 1730718776864.json",
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static void close(BuildContext context) {
    Navigator.pop(context);
  }
}

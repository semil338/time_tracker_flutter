import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_button.dart';

class SignInButton extends CustomButton {
  SignInButton({
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        super(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 15,
            ),
          ),
          color: color,
          height: 40,
          onPressed: onPressed,
        );
}

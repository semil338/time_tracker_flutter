import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_button.dart';

class SocialSignInButton extends CustomButton {
  SocialSignInButton({
    @required String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(assetName != null),
        assert(text != null),
        super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(assetName),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                ),
              ),
              Opacity(opacity: 0, child: Image.asset(assetName)),
            ],
          ),
          color: color,
          height: 40,
          onPressed: onPressed,
        );
}

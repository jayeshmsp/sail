import 'package:flutter/material.dart';
import 'package:sali/Constants/app_constant.dart';

class CustomRaisedButton extends StatelessWidget {
final String? buttonTitle;
final VoidCallback raisedButtonHandler;
final Color? backgroundColor,textColor;
final double? width;

CustomRaisedButton({
  this.buttonTitle,
  required this.raisedButtonHandler,
  this.backgroundColor,
  required this.width,
  this.textColor
});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 90,
      child: ElevatedButton(
        child: Text(
          buttonTitle!,
          style: TextStyle(
            color: textColor,
            fontSize: 26,
            fontFamily: Fonts.fontRegular
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              backgroundColor!),
          shape: MaterialStateProperty.all<
              RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7))),
          elevation: MaterialStateProperty.all<double>(0)
        ),
        onPressed: raisedButtonHandler,
      ),
    );
  }
}

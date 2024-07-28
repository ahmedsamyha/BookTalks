
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required  this.onPressed

  });
  final String? text;
  final Color backgroundColor;
  final Color textColor;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * .8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: TextButton(
            style: TextButton.styleFrom(backgroundColor: backgroundColor),
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Text(
                text!,
                style:  TextStyle(color: textColor, fontSize: 16),
              ),
            )),
      ),
    );
  }
}

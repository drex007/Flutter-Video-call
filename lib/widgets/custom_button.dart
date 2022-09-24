import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_video_call/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 17),
        ),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: buttonColor),
                borderRadius: BorderRadius.circular(30)),
            primary: buttonColor,
            minimumSize: Size(double.infinity, 50)),
      ),
    );
  }
}

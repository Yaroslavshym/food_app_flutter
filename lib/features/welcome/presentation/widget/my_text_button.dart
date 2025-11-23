import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final TextStyle textStyle;
  const MyTextButton({super.key, 
    required this.text,
    required this.onTap,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}

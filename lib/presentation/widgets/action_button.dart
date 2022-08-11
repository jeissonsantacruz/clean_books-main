import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData? icon;
  final Color bgColor;
  final Color textColor;
  final Color iconColor;
  final String text;
  final VoidCallback? callback;
  const ActionButton(
      {Key? key,
      required this.text,
      this.callback,
      this.icon,
      this.bgColor = Colors.white,
      this.textColor = Colors.black,
      this.iconColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        primary: bgColor,
        fixedSize: const Size(200, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

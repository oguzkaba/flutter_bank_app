import 'package:flutter/material.dart';

import '../constants.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final Color? color;
  final double width;
  final String title;
  final void Function()? tap;
  final TextDecoration? textdec;
  const ElevatedButtonWidget({
    this.color,
    required this.title,
    required this.width,
    required this.tap,
    this.textdec,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color ?? primaryRed,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
          onPressed: tap,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: textdec ?? TextDecoration.none),
          )),
    );
  }
}

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class QButtonLocal extends StatelessWidget {
  final String label;
  final Function onPressed;
  final Color? color;
  const QButtonLocal(
      {Key? key, required this.label, required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? primaryColor,
      ),
      onPressed: () => onPressed(),
      child: Text(
        label,
        style: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14)),
      ),
    );
  }
}

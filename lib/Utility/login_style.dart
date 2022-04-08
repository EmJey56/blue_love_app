import 'package:flutter/material.dart';

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'Yekan',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color.fromRGBO(255, 255, 255, 1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kHintTextStyle = TextStyle(
  color: Colors.black87,
  fontFamily: 'Yekan',
  fontSize: 13.0,
);

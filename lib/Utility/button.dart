import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback selectHandler;
  final Color colorBtn;
  final bool isSelected;
  CustomButton(
      {required this.buttonText,
      required this.selectHandler,
      required this.isSelected,
      this.colorBtn = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: RaisedButton(
        color: isSelected ? colorBtn : Colors.white,
        textColor: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: colorBtn,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
              ),
            ),
            Text(buttonText),
          ],
        ),
        onPressed: selectHandler,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'button.dart';

class CustomCircle extends StatelessWidget {
  // final int top, right, width, height;
  final children;

  const CustomCircle({Key? key, this.children}) : super(key: key);
  // CustomCircle(this.top, this.right, this.width, this.height);

  Widget circle(double top, double right, double width, double height,
          Color color, Color shadow,
          {bool isBottom = false}) =>
      Positioned(
        top: !isBottom ? top : null,
        right: right,
        bottom: isBottom ? top : null,
        child: Container(
          width: width,
          height: height,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: color, boxShadow: [
            BoxShadow(
              blurRadius: 20,
              spreadRadius: 0.1,
              blurStyle: BlurStyle.outer,
              color: shadow,
            )
          ]),
        ),
      );
  @override
  Widget build(BuildContext context) {
    double top = MediaQuery.of(context).viewPadding.top;
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          circle(
            -MediaQuery.of(context).size.width * 1.45,
            -MediaQuery.of(context).size.width / 1.6,
            MediaQuery.of(context).size.width * 1.9,
            MediaQuery.of(context).size.width * 2.1,
            const Color(0xFFF53C3C),
            const Color(0x99F53C3C),
          ),
          circle(
            -MediaQuery.of(context).size.width * 1.35,
            -MediaQuery.of(context).size.width / 1.7,
            MediaQuery.of(context).size.width * 1.6,
            MediaQuery.of(context).size.width * 2,
            const Color(0x66B20101),
            const Color(0x22B20101),
          ),
          circle(
            -MediaQuery.of(context).size.width * 1.67,
            -MediaQuery.of(context).size.width / 5.6,
            MediaQuery.of(context).size.width * 1.9,
            MediaQuery.of(context).size.width * 2.1,
            const Color(0xFFF53C3C),
            const Color(0x99F53C3C),
            isBottom: true,
          ),
          circle(
            -MediaQuery.of(context).size.width * 1.55,
            -MediaQuery.of(context).size.width / 8,
            MediaQuery.of(context).size.width * 1.6,
            MediaQuery.of(context).size.width * 2,
            const Color(0x66B20101),
            const Color(0x22B20101),
            isBottom: true,
          ),
          SafeArea(
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}

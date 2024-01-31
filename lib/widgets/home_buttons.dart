import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  const HomePageButton(
      {super.key,
      required this.height,
      required this.width,
      required this.color,
      required this.icon,
      required this.text,
      required this.onTap,
      required this.shadowColor});
  final double height;
  final double width;
  final Color color;
  final Color shadowColor;
  final Widget icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: shadowColor.withOpacity(0.35),
            offset: Offset(0, 8),
            blurRadius: 7)
      ], color: color, borderRadius: BorderRadius.circular(36.0)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(36),
          child: Stack(
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 18),
                  child: icon),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 18),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

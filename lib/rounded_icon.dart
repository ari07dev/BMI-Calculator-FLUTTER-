import 'package:flutter/material.dart';


class RoundedIconButton extends StatelessWidget {

  RoundedIconButton({this.icon,this.onPressed});
  final  icon;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed:onPressed,
      elevation: 0.0,
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Colors.cyanAccent,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.6,
      ),
    );
  }
}
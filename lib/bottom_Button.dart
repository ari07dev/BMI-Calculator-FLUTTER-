import 'package:flutter/material.dart';
import 'constants.dart';


class Bottom_Button extends StatelessWidget {

  const Bottom_Button({required this.text,required this.onPress});

  final  onPress;
  final  text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: bottomContainerColour,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10.0),
        height: bottomContainerHeight,
        child: Center(
          child: Text(text,
            style: bottomcontainerTextstyle,),),
      ),
    );
  }
}

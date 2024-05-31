import 'package:bmical/constants.dart';
import 'package:flutter/material.dart';
import 'resuable_card.dart';
import 'bottom_Button.dart';

class Results_Page extends StatelessWidget {

  Results_Page({required this.bmiResult,required this.resultText,required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATE'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result',
            style: bottomstyle,),
          ),
          ),
          Expanded(
          flex: 5,
              child: ResuableCard(colour: activeContainerColour,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text(bmiResult.toUpperCase(),style: greentext,),
                  Text(resultText,style: weightFont,),

                  Text(interpretation,style: interpretationStyle,
                  textAlign: TextAlign.center,),

                ],
              ),),),
          Bottom_Button(text: 'RE-CALCULATE', onPress: () {
            Navigator.pop(context);
          }
          ),

        ],
      ),
    );
  }
}


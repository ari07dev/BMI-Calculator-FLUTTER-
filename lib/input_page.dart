import 'package:bmical/calculator_brain.dart';
import 'package:bmical/resultz_Page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'resuable_card.dart';
import 'constants.dart';
import 'rounded_icon.dart';
import 'bottom_Button.dart';


enum Gender {male,female}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: ResuableCard(
              onPress: (){
                setState(() {
                  selectedGender = Gender.male;
                });
              },colour:selectedGender == Gender.male?activeContainerColour:inactiveColour,
              cardchild: IconContent(FontAwesomeIcons.mars,'Male',
              ),
              ),
              ),
              Expanded(child: ResuableCard(
              onPress: (){
              setState(() {
              selectedGender = Gender.female;
              });
              },colour:selectedGender == Gender.female?activeContainerColour:inactiveColour,
                cardchild: IconContent(FontAwesomeIcons.venus,'Female'),
              ),
              ),
            ],
          ),
          ),
          Expanded(child: ResuableCard(colour:activeContainerColour,
          cardchild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('HEIGHT',style: labelTextStyle,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(height.toString(),style: heightNumberText,),
                  const Text('cm',style: labelTextStyle,),
                ],
              ),
                  Slider(value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: const Color(0xFFEB1555),
                    inactiveColor: const Color(0xFF8D8E98),
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.toInt();
                      });
                    },
                  ),

            ],
          ),
          ),
          ),
          Expanded(child: Row(
            children: [
              Expanded(child: ResuableCard(colour:activeContainerColour,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('WEIGHT',style: labelTextStyle,),
                  Text(weight.toString(),style: heightNumberText,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedIconButton(icon: FontAwesomeIcons.minus,
                      onPressed: (){
                        setState(() {
                          weight--;
                        });
                      },
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      RoundedIconButton(icon: FontAwesomeIcons.plus,
                        onPressed: (){
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              ),
              ),
              Expanded(child:ResuableCard(colour:activeContainerColour,
                cardchild:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('AGE',style: labelTextStyle,),
                    Text(age.toString(),style: heightNumberText,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedIconButton(icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },),
                        const SizedBox(
                          width: 10.0,
                        ),
                        RoundedIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },),
                      ],
                    ),
                  ],
                ),

              ),),
            ],
          ),
          ),
          
          Bottom_Button(text: 'CALCULATE', onPress: () {

            CalculatorBrain cal = CalculatorBrain(height: height,weight: weight);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Results_Page(
                bmiResult: cal.calculateBMI(),
                resultText: cal.getResult(),
                interpretation: cal.getInterpretation(),
              )),
            );
          })

            ],
          ),
    );
  }
}







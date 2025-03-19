import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/constants.dart';
import 'result_page.dart';
import  '../core/calculator.dart';
import '../widgets/reuseable_card.dart';



enum Gender{male, female}
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender activeGender = Gender.male;
  int height = 120;
  int weight = 45;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
        appBar: AppBar(
          title: const Text("BMI Calculator"),
          elevation: 0,
        ),

        body: ListView(
        children: [
        
         
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeGender == Gender.male? kMaleActiveCardColor:kMaleInActiveCardColor,
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(FontAwesomeIcons.mars,size: 80,color: activeGender == Gender.male? Colors.grey : null ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 50),
                            child: Text('MALE', style: kGenderTextStyle,),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ]
                    ),
                    onPress: (){
                      setState(() {
                        activeGender = Gender.male;
                      });
                    },
                          
                  ),
                ),
                Expanded(
                  child: ReusableCard(
        
                    colour: activeGender == Gender.female? kFemaleActiveCardColor:kFemaleInActiveCardColor,
                    child:  const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 50),
                        child: Text('FEMALE', style: kGenderTextStyle,),
                      ),
                          SizedBox(
                            height: 15,
                          ),
                        ]
                    ),
                    onPress: (){
                      setState(() {
                        activeGender = Gender.female;
                      });
        
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
        
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text('cm', style: kLabelTextStyle,),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
        
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kBottomContainerColor,
                      activeTrackColor: Colors.white,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                      trackHeight: 1,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 220,
                      onChanged: (double value){
                        setState(() {
                          height = value.toInt();
                        });
                      },
                    ),
                  ),
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                ],
              ),
              onPress: (){},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT',
                          style: kLabelTextStyle,),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
        
                            RoundIconButton(
                                icon: const Icon(FontAwesomeIcons.minus, color: Colors.white,),
                                onTap: (){
                                  setState(() {
                                    weight--;
                                  });
                                }
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                                icon: const Icon(FontAwesomeIcons.plus, color: Colors.white,),
                                onTap: (){
                                  setState(() {
                                    weight++;
                                  });
                                }
                            ),
        
                          ],
                        )
                      ],
                    ),
                    onPress: (){},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE',
                          style: kLabelTextStyle,),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: const Icon(FontAwesomeIcons.minus, color: Colors.white,),
                                onTap: (){
                                  setState(() {
                                    age--;
                                  });
                                }
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                                icon: const Icon(FontAwesomeIcons.plus, color: Colors.white,),
                                onTap: (){
                                  setState(() {
                                    age++;
                                  });
                                }
                            ),
        
                          ],
                        )
                      ],
                    ),
                    onPress: (){},
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: ()
            {
              Calculate bmiCalculate = Calculate(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                          bmiResult: bmiCalculate.calculateBMI(),
                          result: bmiCalculate.getResults(),
                          review: bmiCalculate.getReview())
                  )
              );
            },
            child: Container(
              width: double.infinity,
              height: kBottomContainerHeight,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kBottomContainerColor,
                borderRadius: BorderRadius.circular(10)
              ),
              
              child: const Center(
          
                child: Text('Calculate',
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 35),),
              ),
            ))
          ],
        )
        
    );
  }
}



class RoundIconButton extends StatelessWidget {

  const RoundIconButton({super.key, required this.icon, required this.onTap});

  final Icon icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      fillColor: kButtonColor,
      onPressed: ()
      {
        onTap();
      },
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      elevation: 7,
      child: icon,
    );
  }
}
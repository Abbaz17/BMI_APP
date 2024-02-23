import 'package:bmi_app/widgets/cutom_btton.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import 'package:bmi_app/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

import 'result.dart';

enum Gender { Male, Female }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 180;
  int age = 28;
  int weight = 65;
  Gender selectedGender = Gender.Male;

  void _goToResultScreen() {
    double result = weight / pow(height / 100, 2);
    print(result);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ResultScreen(result: result,);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMICalclator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    selected: selectedGender == Gender.Male ? true : false,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    child: IconContent(
                      icondat: FontAwesomeIcons.mars,
                      title: "Male",
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  selected: selectedGender == Gender.Female ? true : false,
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  },
                  child: IconContent(
                    icondat: FontAwesomeIcons.venus,
                    title: "Female",
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("HEIGHT"),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    height.round().toString(),
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                  ),
                  Text(
                    "cm",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color: Colors.grey),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SliderTheme(
                data: SliderThemeData(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                    thumbColor: kBOttomContainrColour,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16)),
                child: Slider(
                    value: height,
                    min: 0,
                    max: 310,
                    onChanged: (newVal) {
                      setState(() {
                        height = newVal;
                      });
                    }),
              )
            ]),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight"),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 30),
                            ),
                            Text(
                              "kg",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RounButton(
                              iconData: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (weight <= 0) {
                                    weight = 0;
                                  } else {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RounButton(
                              iconData: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ]),
                )),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age"),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '$age',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 30),
                            ),
                            Text(
                              "yrs",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RounButton(
                              iconData: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (age < 1) {
                                    age = 0;
                                  } else {
                                    age--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RounButton(
                              iconData: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomButton(onPressed: _goToResultScreen,)
        ],
      ),
    );
  }
}




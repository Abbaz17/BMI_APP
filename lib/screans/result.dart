import 'package:bmi_app/widgets/cutom_btton.dart';
import 'package:flutter/material.dart';

import '../widgets/reasuble_card.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});
  final double result;
  String resultInterprete(){
        if (result >= 0 && result <= 18) 
          return "You are under weight" ;
        
        else if(result >= 19 && result <= 25)
          return "You are Normal" ;
        
        else 
        return "you are overweight" ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ResultScreen"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your result is ",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.grey.shade500),
            // textAlign: TextAlign.left,
          ),
          Expanded(
              child: ReusableCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    result.toStringAsFixed(1),
                    style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade500),
                  ),
                ),
                const SizedBox(height: 20,),
                Center(
                  child: Text(
                    resultInterprete(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade300),
                        textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )),
          CustomButton(
            onPressed: () {
              Navigator.pop(context) ;
            },
            title: "Re-calculate",
          )
        ],
      ),
    );
  }
}

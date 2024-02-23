import 'package:bmi_app/constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, this.title});
  final Function()? onPressed ;
  final String? title ;

  @override
  Widget build(BuildContext context) {
    return  RawMaterialButton(
            onPressed: onPressed,
            child: Text(
              title ?? "Calculate",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            fillColor: kBOttomContainrColour,
            constraints:
                BoxConstraints.tightFor(width: double.infinity, height: 56),
          ) ;
  }
}
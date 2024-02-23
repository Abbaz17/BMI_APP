import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
 final IconData icondat ;
 final String title ;
 IconContent({required this.icondat ,required this.title}) ;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icondat,
            size: 80,
          ),
          const SizedBox(height: 10) ,
          Text(title,style: TextStyle(fontSize: 20,color: Colors.grey),)
        ]);
  }
}

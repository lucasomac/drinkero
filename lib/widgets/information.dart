import 'package:drinkero/res/palet.dart';
import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  final String description;
  final String value;

  const Information(this.description, this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            description,
            style: const TextStyle(
                color: Palet.informationDescriptionColor,
                fontSize: 9,
                fontFamily: 'Roboto'),
          ),
          Text(
            value,
            style: const TextStyle(
                color: Palet.informationValueColor,
                fontSize: 10,
                fontFamily: 'Roboto'),
          ),
        ],
      ),
    );
  }
}

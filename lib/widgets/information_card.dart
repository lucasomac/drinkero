import 'package:drinkero/model/drink.dart';
import 'package:drinkero/res/palet.dart';
import 'package:drinkero/widgets/information.dart';
import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  final Drink drink;

  const InformationCard(this.drink, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Information('GLASS TYPE', drink.strGlass ?? '')),
        Container(
          color: Palet.informationDescriptionColor,
          width: 1,
          height: 30,
        ),
        Information('CATEGORY', drink.strCategory ?? ''),
        Container(
          color: Palet.informationDescriptionColor,
          width: 1,
          height: 30,
        ),
        Information('STRENGTH', drink.strAlcoholic ?? ''),
      ],
    );
  }
}

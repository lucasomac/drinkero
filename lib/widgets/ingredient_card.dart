import 'package:drinkero/res/palet.dart';
import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final String urlImage;

  const IngredientCard(this.urlImage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      elevation: 16,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Palet.backgroundColor,
            Color(0xFF22142b),
            Palet.backgroundColor
          ]),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Center(
          child: Image.network(
            urlImage,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final String urlImage;

  const IngredientCard(this.urlImage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      urlImage,
      width: 30,
      height: 30,
    );
  }
}

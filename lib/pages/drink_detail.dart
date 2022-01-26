import 'package:drinkero/model/drink.dart';
import 'package:flutter/material.dart';

class DrinkDetail extends StatelessWidget {
  final Drink? drink;

  const DrinkDetail(this.drink, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.4),
        child: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.favorite_border),
            )
          ],
          flexibleSpace: ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(drink?.strDrinkThumb ?? ""),
                    fit: BoxFit.fill),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(128),
                ),
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(128),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(128), topRight: Radius.circular(128)),
        ),
        padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              drink?.strDrink ?? "",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              drink?.strAlcoholic ?? "",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 20),
            Text(
                'Ingredientes: ${drink?.getIngredients().toString().replaceAll(']', '').replaceAll('[', '')}'),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Instruções: ${drink?.strInstructions}',
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

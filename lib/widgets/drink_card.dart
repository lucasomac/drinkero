import 'package:drinkero/model/drink.dart';
import 'package:drinkero/pages/stack_drink.dart';
import 'package:flutter/material.dart';

class DrinkCard extends StatelessWidget {
  final Drink drink;

  const DrinkCard(this.drink, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 400,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StackDrink(drink)));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(drink.strDrinkThumb ?? ""),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      drink.strDrink ?? "",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  const InkWell(
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:drinkero/model/drink.dart';
import 'package:drinkero/res/links.dart';
import 'package:drinkero/res/palet.dart';
import 'package:drinkero/widgets/information_card.dart';
import 'package:drinkero/widgets/ingredient_card.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

class StackDrink extends StatelessWidget {
  final Drink? drink;

  const StackDrink(this.drink, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: MediaQuery.of(context).size.height * 0.6,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Scaffold(
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
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.36,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF22142b), Palet.backgroundColor]),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28)),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.64,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      drink?.strDrink ?? "",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      drink?.strAlcoholic ?? "",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText2
                          ?.copyWith(fontSize: 20),
                    ),
                    InformationCard(drink!),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ingredientes',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText2
                              ?.copyWith(fontSize: 16),
                        ),
                        Text(
                          '${drink?.getIngredients().length} itens',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText2
                              ?.copyWith(fontSize: 16),
                        )
                      ],
                    ),
                    Flexible(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 4,
                                  mainAxisSpacing: 4),
                          itemCount: drink?.getIngredients().length,
                          itemBuilder: (context, index) {
                            return IngredientCard(sprintf(Links.urlImage,
                                [drink?.getIngredients()[index]]));
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'Instruções: ${drink?.strInstructions}',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText2
                            ?.copyWith(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

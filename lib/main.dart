import 'package:drinkero/res/palet.dart';
import 'package:drinkero/widgets/drink_card.dart';
import 'package:flutter/material.dart';

import 'controller/drink_controller.dart';
import 'model/alphabeth.dart';
import 'model/response_drinks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drinkero',
      theme: ThemeData(
        primaryColor: Palet.backgroundColor,
        primaryTextTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 32,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      home: const Scaffold(
          backgroundColor: Palet.backgroundColor,
          body: MyHomePage(title: 'Drinkero')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selection = Alphabeth.alphabeth[0];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Escolha a inicial do seu drink',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyText1
                      ?.copyWith(fontSize: 24)),
              DropdownButton(
                borderRadius: BorderRadius.circular(8),
                menuMaxHeight: 300,
                dropdownColor: Palet.backgroundColor,
                value: _selection,
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
                elevation: 16,
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyText1
                    ?.copyWith(fontSize: 16),
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _selection = newValue!;
                  });
                },
                items: Alphabeth.alphabeth
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value.toUpperCase()),
                  );
                }).toList(),
              ),
            ],
          ),
          Flexible(child: _buildBodyDrink(context, _selection.toString())),
        ],
      ),
    );
  }

  FutureBuilder<ResponseDrinks> _buildBodyDrink(
      BuildContext context, String letra) {
    DrinkController controller = DrinkController();
    return FutureBuilder<ResponseDrinks>(
      future: controller.getDrinksByCaracter(letra),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Center(
              child: Text("Não conectado!"),
            );
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
            return const Center(
              child: Text("Conectado!"),
            );
          case ConnectionState.done:
            final ResponseDrinks response;
            if (snapshot.hasData) {
              response = snapshot.data!;
              if (snapshot.data?.drinks != null) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return DrinkCard(response.drinks![index]);
                  },
                  itemCount: response.drinks?.length,
                );
              } else {
                return Center(
                  child: Text(
                      "Não há drinks iniciados com $_selection na base de dados"),
                );
              }
            } else {
              return const Center(child: Text("O retorno está vazio!"));
            }
        }
      },
    );
  }
}

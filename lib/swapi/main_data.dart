import 'package:drinkero/swapi/people.dart';
import 'package:drinkero/swapi/people_controller.dart';
import 'package:flutter/material.dart';

FutureBuilder<People> _buildBodyPeople(BuildContext context, String id) {
  PeopleController controller = PeopleController();
  return FutureBuilder<People>(
    future: controller.getDrinksByCaracter(id),
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
            child: Text("Connected!"),
          );
        case ConnectionState.done:
          final People? people = snapshot.data;
          return _buildListViewPeople(context, people!);
      }
    },
  );
}

Widget _buildListViewPeople(BuildContext context, People people) {
  return Card(
    child: ListTile(
      leading: Image.network(
        people.name ??
            "https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg",
        width: 50,
        height: 50,
      ),
      title: Text(
        people.name ?? "",
        style: const TextStyle(fontSize: 20),
      ),
      subtitle: Text(people.birthYear ?? ""),
    ),
  );
}

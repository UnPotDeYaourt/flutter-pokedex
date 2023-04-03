import 'package:flutter/material.dart';
import 'package:pokedex/models/PokemonDetails.dart';
import 'package:pokedex/services/get_pokemon_details_service.dart';
import 'package:pokedex/utils/uppercase_first_letter.dart';

import '../pages/ViewPokemon.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({super.key, required this.url});

  final String url;

  @override
  State<PokemonCard> createState() => _PokemonCard();
}

class _PokemonCard extends State<PokemonCard> {
  late Future<PokemonDetails> pokemonDetails;

  @override
  void initState() {
    super.initState();
    pokemonDetails = fetchPokemonDetails(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PokemonDetails>(
      future: pokemonDetails,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Card(
              child: ListTile(
                title: Text(
                    upperCaseFirstLetter(snapshot.data!.name),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    )
                ),
                subtitle: Text(
                    upperCaseFirstLetter(snapshot.data!.types[0].type.name),
                    style: const TextStyle(
                        fontSize: 15
                    )
                ),
                leading: Image.network(snapshot.data!.sprites.frontDefault),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewPokemon(pokemonDetails: snapshot.data!),
                      ),
                    );
                  },
                )
              )
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const Text('Loading...');
      },
    );
  }
}

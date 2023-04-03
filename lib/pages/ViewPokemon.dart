import 'package:flutter/material.dart';
import 'package:pokedex/components/StatsTable.dart';
import 'package:pokedex/components/common/MargedTitle.dart';
import 'package:pokedex/utils/uppercase_first_letter.dart';
import 'package:pokedex/models/PokemonDetails.dart';

class ViewPokemon extends StatefulWidget {
  const ViewPokemon({super.key, required this.pokemonDetails});

  final PokemonDetails pokemonDetails;

    @override
    State<ViewPokemon> createState() => _ViewPokemon();
}

class _ViewPokemon extends State<ViewPokemon> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(upperCaseFirstLetter(widget.pokemonDetails.name)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: Image.network(widget.pokemonDetails.sprites.frontDefault),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        upperCaseFirstLetter(widget.pokemonDetails.name),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Type: ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 15
                            ),
                          ),
                          Text(
                            widget.pokemonDetails.types.map((e) => upperCaseFirstLetter(e.type.name)).join(', '),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Height: ${widget.pokemonDetails.height}  Weight: ${widget.pokemonDetails.weight}kg',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Divider(),
            Column(
              children: [
                const MargedTitle(title: 'Base Stats'),
                StatsTable(stats: widget.pokemonDetails.stats),
                const MargedTitle(title: 'Abilities'),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.pokemonDetails.abilities.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(upperCaseFirstLetter(widget.pokemonDetails.abilities[index].ability.name)),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
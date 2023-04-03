import 'package:flutter/material.dart';

import 'package:pokedex/models/PokemonDetails.dart';
import 'package:pokedex/utils/uppercase_first_letter.dart';

class StatsTable extends StatelessWidget {
  const StatsTable({super.key, required this.stats});

  final List<Stat> stats;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.black,
        width: 0.5,
        style: BorderStyle.solid,
      ),
      children: [
        for (var stat in stats)
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  upperCaseFirstLetter(stat.stat.name),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  stat.baseStat.toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 15
                  ),
                ),
              )
            ]
          )
      ],
    );
  }
}
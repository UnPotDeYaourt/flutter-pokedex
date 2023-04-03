import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/PokemonList.dart';

Future<PokemonList> fetchPokemonList() async {
  final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/'));

  if (response.statusCode == 200) {
    return PokemonList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load PokemonList');
  }

}
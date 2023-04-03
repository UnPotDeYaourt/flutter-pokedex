import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/PokemonDetails.dart';

Future<PokemonDetails> fetchPokemonDetails(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return PokemonDetails.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load PokemonDetails');
  }
}
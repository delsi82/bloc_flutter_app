import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_flutter_app/data/models/pokemon_light.dart';
import 'package:pokemon_flutter_app/data/remote/dto/pokemon.dart';
import 'package:pokemon_flutter_app/data/remote/dto/pokemon_list.dart';
import 'package:pokemon_flutter_app/data/remote/dto/pokemon_species.dart';
import 'package:pokemon_flutter_app/data/remote/service/pokemon_service.dart';

class PokemonRepository {
  AppService _appService = AppService();

  Future<List<PokemonLight>> getPokemonList(
      {int page = 0}) async {
    http.Response apiResponse = await _appService.get(endpoint: "https://pokeapi.co/api/v2/pokemon?limit=20&offset=$page");
    List<PokemonLight> pokeList = [];
    if (apiResponse.statusCode == 200) {
      PokemonList pokeArray =
          PokemonList.fromJson(jsonDecode(apiResponse.body));
      if (pokeArray.results != null) {

        for (var result in pokeArray.results!) {
          if (result.url.isNotEmpty) {
            //TODO: check if the name is in the local db
            http.Response pokeResponse = await _appService.get(
                endpoint: result.url);
            if (pokeResponse.statusCode == 200) {
              var pokemon = Pokemon.fromJson(jsonDecode(pokeResponse.body));
              PokemonLight pokemonLight = PokemonLight();

              pokemonLight.id = pokemon.id;
              pokemonLight.name = pokemon.name ?? "No Name";
              pokemonLight.image = pokemon.sprites?.frontDefault ?? "";

              if(pokemon.species != null) {
                if(pokemon.species!.url != null) {
                  http.Response apiSpecies = await _appService.get(
                      endpoint: pokemon.species!.url!);

                  if(apiSpecies.statusCode == 200) {
                    var pokemonSpecie = PokemonSpecies.fromJson(jsonDecode(apiSpecies.body));
                    pokemonLight.description = pokemonSpecie.flavorTextEntries!.firstWhere((element) => element.language!.name!.toLowerCase() == "it").flavorText ?? "";
                  }

                }}

              pokeList.add(pokemonLight);
            } else {
              print(pokeResponse.body);
            }
          }
        }
      }
    } else {
      throw Exception(apiResponse.body);
    }

    return pokeList;
  }
}

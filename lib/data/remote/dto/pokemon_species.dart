// To parse this JSON data, do
//
//     final pokemonSpecies = pokemonSpeciesFromJson(jsonString);

import 'dart:convert';

PokemonSpecies pokemonSpeciesFromJson(String str) => PokemonSpecies.fromJson(json.decode(str));

String pokemonSpeciesToJson(PokemonSpecies data) => json.encode(data.toJson());

class PokemonSpecies {
  PokemonSpecies({
    this.flavorTextEntries,
  });

  List<FlavorTextEntry>? flavorTextEntries;

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) => PokemonSpecies(
    flavorTextEntries: json["flavor_text_entries"] == null ? null : List<FlavorTextEntry>.from(json["flavor_text_entries"].map((x) => FlavorTextEntry.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "flavor_text_entries": flavorTextEntries == null ? null : List<dynamic>.from(flavorTextEntries!.map((x) => x.toJson())),
  };
}

class FlavorTextEntry {
  FlavorTextEntry({
    this.flavorText,
    this.language,
    this.version,
  });

  String? flavorText;
  Language? language;
  Language? version;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) => FlavorTextEntry(
    flavorText: json["flavor_text"] == null ? null : json["flavor_text"],
    language: json["language"] == null ? null : Language.fromJson(json["language"]),
    version: json["version"] == null ? null : Language.fromJson(json["version"]),
  );

  Map<String, dynamic> toJson() => {
    "flavor_text": flavorText == null ? null : flavorText,
    "language": language == null ? null : language!.toJson(),
    "version": version == null ? null : version!.toJson(),
  };
}

class Language {
  Language({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    name: json["name"] == null ? null : json["name"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "url": url == null ? null : url,
  };
}

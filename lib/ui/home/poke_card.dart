import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/data/models/pokemon_light.dart';
import 'package:pokemon_flutter_app/data/remote/dto/pokemon.dart';

class PokeCard extends StatefulWidget {
  final PokemonLight? _pokemon;

  const PokeCard({required PokemonLight? pokemon}) : this._pokemon = pokemon;

  @override
  State<StatefulWidget> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: 120,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Card(
          child: widget._pokemon != null
              ? ListTile(
                  leading: CachedNetworkImage(
                    placeholder: (context, url) => CircularProgressIndicator(),
                    imageUrl: widget._pokemon!.image,
                  ),
                  title: Text(widget._pokemon!.name),
                  subtitle: Text(widget._pokemon!.description),
                )
              : Container(
                  width: double.infinity,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                )),
    );
  }
}

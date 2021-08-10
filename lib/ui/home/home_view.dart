import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter_app/ui/home/bloc/home_bloc.dart';
import 'package:pokemon_flutter_app/ui/home/poke_card.dart';
import 'package:pokemon_flutter_app/ui/widget/shimmer_loading.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  var _list = [];
  bool _isLoading = false;
  late HomeBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = BlocProvider.of<HomeBloc>(context);
    _bloc.add(HomeInit());
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<HomeBloc, HomeState>(listener: (context, state) {
        if (state is HomeSuccess) {
          _list = state.list ?? [];
        }
        _isLoading = state is HomeLoading;
      }, child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Pokemon List"),
              centerTitle: true,
            ),
            body: Padding(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: ListView.separated(
                  itemBuilder: (context, index) => ShimmerLoading(
                    isLoading: _isLoading,
                    child: PokeCard(
                      pokemon: _isLoading ? null : _list[index],
                    ),
                  ),
                  separatorBuilder: (context, index) => Container(
                    height: 2,
                  ),
                  itemCount: state is HomeLoading ? 20 : _list.length),
            ),
          );
        },
      ));
}

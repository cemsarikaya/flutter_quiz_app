import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/model/pokemon_details_model.dart';
import 'package:flutter_quiz_app/product/service/project_dio.dart';
import 'package:flutter_quiz_app/service/pokemon_details_service.dart';
import 'package:flutter_quiz_app/viewModel/pokemon_details_provider.dart';
import 'package:provider/provider.dart';

class PokemonDetailsView extends StatefulWidget {
  final path;
  const PokemonDetailsView({Key? key, this.path}) : super(key: key);
  @override
  State<PokemonDetailsView> createState() => _PokemonDetailsViewState();
}

class _PokemonDetailsViewState extends State<PokemonDetailsView> with ProjectDioMixin {
  List<PokemonDetailsModel> resources = [];
  List<PokemonDetailsModel> types = [];
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      resources = widget.path;
      types = widget.path;
      print(resources);
    }

    return ChangeNotifierProvider(
        create: (context) => PokemonDetailsProvider(PokemonDetailsService(widget.path)),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(),
            body: const PokemonListView(),
          );
        });
  }
}

class PokemonListView extends StatelessWidget {
  const PokemonListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = context.watch<PokemonDetailsProvider>();
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: items.abilitiy.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text('${items.abilitiy[index].ability?.name}'),
              ],
            );
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: items.typesItem.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Text('${items.typesItem[index].type?.name}'),
              ],
            );
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: context.watch<PokemonDetailsProvider>().statsItem.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Text('${items.statsItem[index].stat?.name} ${items.statsItem[index].baseStat}'),
              ],
            );
          },
        ),
        Column(
          children: [
            Text('Weight : ${items.weightItem}'),
            Text('Height : ${items.heightItem}'),
            Text('Name : ${items.nameItem}'),
            Image.network('${items.sprites?.other?.home?.frontDefault}')
          ],
        ),
      ],
    );
  }
}

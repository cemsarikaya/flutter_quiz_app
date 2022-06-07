import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/product/constant/padding_items.dart';
import 'package:flutter_quiz_app/product/service/project_dio.dart';
import 'package:flutter_quiz_app/service/pokemon_service.dart';
import 'package:flutter_quiz_app/viewModel/pokemon_provider.dart';
import 'package:provider/provider.dart';

class PokemonView extends StatefulWidget {
  const PokemonView({Key? key}) : super(key: key);
  @override
  State<PokemonView> createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonProvider(PokemonService(service)),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
            itemCount: context.watch<PokemonProvider>().resources.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: PaddindUtility().paddingCard,
                child: GestureDetector(
                  onTap: () {},
                  child: Card(
                    child: Padding(
                      padding: PaddindUtility().paddingGeneral,
                      child: Text(
                        context.watch<PokemonProvider>().resources[index].name.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

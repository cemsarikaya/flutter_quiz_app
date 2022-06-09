import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/product/constant/padding_items.dart';
import 'package:flutter_quiz_app/service/pokemon_details_service.dart';
import 'package:flutter_quiz_app/view/components/abilities_card_view.dart';
import 'package:flutter_quiz_app/view/components/pokemon_images_card.dart';
import 'package:flutter_quiz_app/view/components/splashScreen.dart';
import 'package:flutter_quiz_app/view/components/stats_card_view.dart';
import 'package:flutter_quiz_app/view/components/types_card_view.dart';
import 'package:flutter_quiz_app/view/components/weight_height_card_view.dart';
import 'package:flutter_quiz_app/viewModel/pokemon_details_provider.dart';
import 'package:provider/provider.dart';

class PokemonDetailsView extends StatefulWidget {
  final path;

  const PokemonDetailsView({
    Key? key,
    this.path,
  }) : super(key: key);
  @override
  State<PokemonDetailsView> createState() => _PokemonDetailsViewState();
}

class _PokemonDetailsViewState extends State<PokemonDetailsView> {
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
    }

    //  final seviyorMuyum = context.watch<PokemonDetailsProvider>().seviyorMuyum(ogrenci)
    return ChangeNotifierProvider(
        create: (context) => PokemonDetailsProvider(PokemonDetailsService(widget.path)),
        builder: (context, child) {
          return context.watch<PokemonDetailsProvider>().isLoading
              ? const SplashView()
              : Scaffold(
                  appBar: AppBar(
                      title: Text(
                        context.watch<PokemonDetailsProvider>().nameItem.toString(),
                      ),
                      actions: [
                        Padding(
                          padding: PaddindUtility().paddingGeneral,
                          child: IconButton(
                              icon: context.watch<PokemonDetailsProvider>().isSeleceted
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      color: Colors.grey,
                                    ),
                              onPressed: () {
                                /* context
                                    .read<PokemonDetailsProvider>()
                                    .changeSelected(context.read<PokemonDetailsProvider>().id);
                                    */
                                context.read<PokemonDetailsProvider>().changeSelected();
                              }),
                        )
                      ]),
                  body: ListView(children: const [PokemonListView()]),
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PokemonImagesCard(items: items),
        WeightHeightView(items: items),
        AbilitiesCardView(items: items),
        StatsView(items: items),
        TypesCardView(items: items),
      ],
    );
  }
}

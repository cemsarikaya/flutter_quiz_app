import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/product/constant/padding_items.dart';
import 'package:flutter_quiz_app/viewModel/pokemon_details_provider.dart';

class TypesCardView extends StatelessWidget {
  const TypesCardView({
    Key? key,
    required this.items,
  }) : super(key: key);

  final PokemonDetailsProvider items;

  @override
  Widget build(BuildContext context) {
    String title = 'Types';
    return Card(
      elevation: 5,
      color: Colors.amber[200],
      child: Column(
        children: [
          Padding(
            padding: PaddindUtility().paddingGeneral,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 0,
              mainAxisExtent: 65,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.typesItem.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    child: Padding(
                      padding: PaddindUtility().paddingGeneral,
                      child: Text(
                        '${items.typesItem[index].type?.name}',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

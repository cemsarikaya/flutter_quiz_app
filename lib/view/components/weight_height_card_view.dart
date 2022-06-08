import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/product/constant/padding_items.dart';
import 'package:flutter_quiz_app/viewModel/pokemon_details_provider.dart';

class WeightHeightView extends StatelessWidget {
  const WeightHeightView({
    Key? key,
    required this.items,
  }) : super(key: key);

  final PokemonDetailsProvider items;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.amber[200],
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: PaddindUtility().paddingGeneral,
          child: Row(
            children: [
              Padding(
                padding: PaddindUtility().paddingGeneral,
                child: _CardView(context, 'Weight', items.weightItem),
              ),
              Padding(
                padding: PaddindUtility().paddingGeneral,
                child: _CardView(context, 'Height', items.heightItem),
              ),
            ],
          ),
        )
      ]),
    );
  }

  Card _CardView(BuildContext context, String text, items) {
    return Card(
      child: Padding(
        padding: PaddindUtility().paddingGeneral,
        child: Column(
          children: [
            Text(text, style: Theme.of(context).textTheme.titleMedium),
            Text(
              '$items',
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}

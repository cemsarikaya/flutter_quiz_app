import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/product/constant/padding_items.dart';
import 'package:flutter_quiz_app/viewModel/pokemon_details_provider.dart';

class PokemonImagesCard extends StatelessWidget {
  const PokemonImagesCard({
    Key? key,
    required this.items,
  }) : super(key: key);

  final PokemonDetailsProvider items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: PaddindUtility().paddingCard,
        child: Card(
          elevation: 5,
          child: Image.network(
            '${items.sprites?.other?.home?.frontDefault}',
            errorBuilder: (context, error, stackTrace) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}

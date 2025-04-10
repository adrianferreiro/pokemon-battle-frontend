import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonCard extends StatelessWidget {
  final PokemonEntity pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Card(
      elevation: 4,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final cardHeight = constraints.maxHeight;
          final imageHeight = cardHeight * 0.7;
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: pokemon.imageUrl,
                  placeholder:
                      (context, url) => Center(
                        child: SizedBox(
                          height: imageHeight * 0.3,
                          width: imageHeight * 0.3,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                  height: imageHeight,
                  width: imageHeight,
                ),
                Text(pokemon.name, style: textStyles.bodyMedium),
              ],
            ),
          );
        },
      ),
    );
  }
}

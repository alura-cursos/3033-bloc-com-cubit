import 'package:flutter/material.dart';
import 'package:bilheteria_panucci/components/classification.dart';

import '../parental_rating.dart';

class PosterCard extends StatelessWidget {
  const PosterCard(
      {super.key,
      required this.title,
      required this.genre,
      required this.classification,
      required this.duration});

  final String? title;
  final String? genre;
  final Classification? classification;
  final String? duration;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
        elevation: 5,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 120,
            maxHeight: 120,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title ?? 'Nome Indisponível',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  genre ?? 'Gênero Indisponível',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Row(
                  children: [
                    ParentalRating(
                      classification: classification,
                    ),
                    Text(duration ?? 'Duração Indisponível',
                        style: Theme.of(context).textTheme.displaySmall),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

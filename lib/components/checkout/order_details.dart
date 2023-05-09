import 'package:flutter/material.dart';

import '../../models/movie.dart';
import '../parental_rating.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.movie, required this.session});

  final Movie movie;
  final String session;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          movie.imageURI != null
              ? Container(
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(movie.imageURI!),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 80,
                  height: 120,
                )
              : Container(
                  margin: const EdgeInsets.only(right: 16),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  width: 80,
                  height: 120,
                  child: const Center(child: Icon(Icons.error, size: 30)),
                ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(movie.name, style: Theme.of(context).textTheme.bodyLarge),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      ParentalRating(
                        classification: movie.classification,
                      ),
                      Text(movie.duration,
                          style: Theme.of(context).textTheme.displaySmall),
                    ],
                  ),
                ),
                Text("Sessão: $session"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

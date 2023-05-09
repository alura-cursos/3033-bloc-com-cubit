import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  const Poster({super.key, required this.imageURL});
  final String? imageURL;

  @override
  Widget build(BuildContext context) {
    return imageURL != null
        ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageURL!),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            height: MediaQuery.of(context).size.height / 2.6,
          )
        : Container(
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            height: MediaQuery.of(context).size.height / 2.6,
            child: const Center(child: Icon(Icons.error)),
          );
  }
}

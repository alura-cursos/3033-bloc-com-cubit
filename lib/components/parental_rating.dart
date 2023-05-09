import 'package:flutter/material.dart';

import 'classification.dart';

class ParentalRating extends StatelessWidget {
  const ParentalRating({super.key, required this.classification});
  final Classification? classification;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
          color: classification != null ? classification!.color : Colors.grey,
          borderRadius: BorderRadius.circular(8.0)),
      margin: const EdgeInsets.only(right: 8.0),
      child: Center(
          child: Text(classification != null ? classification!.code : '?',
              style: Theme.of(context).textTheme.labelMedium)),
    );
  }
}

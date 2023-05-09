import 'package:flutter/material.dart';

class PaymentTotal extends StatelessWidget {
  const PaymentTotal({Key? key, required this.total}) : super(key: key);
  final double total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text("Total:",
                  style: TextStyle(color: Color(0xFF9D9D9D))),
              Text("R\$ ${total.toStringAsFixed(2)}",
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            ],
          ),
        ),
      ],
    );
  }
}

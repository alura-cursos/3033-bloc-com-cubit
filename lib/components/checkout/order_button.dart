import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.account_balance_wallet, color: Theme.of(context).colorScheme.onPrimary,),
          ),
          Text(
            "Pedir",
            style: TextStyle(fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.onPrimary),
          )
        ]),
    );
  }
}

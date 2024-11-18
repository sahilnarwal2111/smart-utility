import 'package:flutter/material.dart';
import 'package:test_drive/theme/theme.dart';
import 'package:test_drive/components/no_transaction_message.dart';

class OrderView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body:Center(
                child: SingleChildScrollView(
                    child: NoTranscationMessage(
                messageTitle: "No Transactions, yet.",
                messageDesc:
                    "You have never placed an order. Let's explore the sport venue near you.",
              )))
                );
  }
}

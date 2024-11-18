import 'package:flutter/material.dart';
import 'package:test_drive/theme/theme.dart';
import 'package:test_drive/components/no_transaction_message.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: NoTranscationMessage(
            messageTitle: "No Completed Order, yet.",
            messageDesc:
                "Please Complete your order. . . \nif you don't have one, Let's explore sport venue near you.",
          ),
        ),
      ),
    );
  }
}

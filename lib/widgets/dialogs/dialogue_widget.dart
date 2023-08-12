import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _sigleton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs() {
    return _sigleton;
  }

  static Widget questionStartDialogue({required VoidCallback onTap}) {
    return AlertDialog(
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("Please login before you start"),
        ],
      ),
      actions: [
        TextButton(onPressed: onTap, child: const Text("Confirm")),
      ],
    );
  }
}

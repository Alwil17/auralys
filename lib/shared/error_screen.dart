import 'package:flutter/material.dart';

//ignore: must_be_immutable
class ErrorScreen extends StatelessWidget {
  final Exception? error;
  late String message;

  ErrorScreen({super.key, this.error}) {
    if (error != null) {
      message = error.toString();
    } else {
      message = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(message)));
  }
}
import 'package:flutter/material.dart';

class UnsupportedBrowser extends StatelessWidget {
  const UnsupportedBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Unsuported browser'),
    ));
  }
}

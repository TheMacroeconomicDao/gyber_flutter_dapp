import 'package:flutter/material.dart';

import '../web3/metamask_provider.dart';

class WrongChain extends StatelessWidget {
  const WrongChain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
            'Wrong chain. Please Fuck to ${MetaMaskProvider.operatingChain}'),
      ),
    );
  }
}

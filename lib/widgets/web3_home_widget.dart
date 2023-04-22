import 'package:flutter/material.dart';
import 'package:metamask_auth_00/screens/connected_screen.dart';
import 'package:metamask_auth_00/screens/unsupported_browser_screen.dart';
import 'package:metamask_auth_00/screens/wrong_chain_screen.dart';
import 'package:provider/provider.dart';

import '../web3/metamask_provider.dart';

class Web3Home extends StatelessWidget {
  const Web3Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: ChangeNotifierProvider(
          create: (context) => MetaMaskProvider()..start(),
          builder: (context, child) {
            return Center(
              child: Consumer<MetaMaskProvider>(
                builder: (context, provider, child) {
                  late final Widget message;
                  if (provider.isConnected && provider.isInOperatingChain) {
                    message = const ConnectedScreen();
                    // message = Text('Fuck');
                  } else if (provider.isConnected &&
                      !provider.isInOperatingChain) {
                    message = const WrongChain();
                  } else if (provider.isEnabled) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MaterialButton(
                          onPressed: () =>
                              context.read<MetaMaskProvider>().connect(),
                          color: Colors.white,
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.network(
                                'https://i0.wp.com/kindalame.com/wp-content/uploads/2021/05/metamask-fox-wordmark-horizontal.png?fit=1549%2C480&ssl=1',
                                width: 250,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    message = const UnsupportedBrowser();
                  }
                  return message;
                },
              ),
            );
          }),
    );
  }
}

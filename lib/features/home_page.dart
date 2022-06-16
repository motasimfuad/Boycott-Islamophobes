import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boycott Islamophobes'),
      ),
      body: Container(
        color: KColors.primary.shade50,
      ),
    );
  }
}

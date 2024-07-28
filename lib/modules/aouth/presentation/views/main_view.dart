import 'package:flutter/material.dart';

import '../widgets/main_background.dart';
import '../widgets/main_view_widget.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [MainBackground(), MainViewWidget()],
      ),
    );
  }
}

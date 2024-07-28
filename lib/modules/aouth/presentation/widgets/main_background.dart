import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  const MainBackground({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/main_top.png',
              width: width * .35,
            )),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            'assets/images/main_bottom.png',
            width: width * 0.22,
          ),
        ),
      ],
    );
  }
}

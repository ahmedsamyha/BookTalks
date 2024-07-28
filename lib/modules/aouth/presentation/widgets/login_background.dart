import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            'assets/images/main_top.png',
            width: width * .35,
          ),
        ),
        Positioned(
          top: height * .85,
          right: 0,
          child: Image.asset(
            'assets/images/login_bottom.png',
            width: width * .45,
          ),
        ),
      ],
    );
  }
}

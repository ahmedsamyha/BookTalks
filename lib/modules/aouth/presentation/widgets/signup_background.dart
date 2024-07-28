import 'package:flutter/cupertino.dart';

class SignUpBackground extends StatelessWidget {
  const SignUpBackground({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset('assets/images/signup_top.png' ,width: width*.35, ),),
        Positioned(
          top:height*.88,
          left: 0,
          child: Image.asset('assets/images/main_bottom.png' ,width: width*.25, ),),

      ],
    );
  }
}

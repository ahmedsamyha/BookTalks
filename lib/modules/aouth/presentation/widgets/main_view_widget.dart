import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mytask/utility/constants/colors.dart';

import '../views/login_view.dart';
import '../views/signup_view.dart';
import 'default_button.dart';

class MainViewWidget extends StatelessWidget {
  const MainViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height * .13,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'WELCOME TO BOOK TALKS',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: height * .05,
          ),
          SvgPicture.asset(
            'assets/icons/chat.svg',
            height: height * 0.45,
          ),
          SizedBox(
            height: width * .09,
          ),
          DefaultButton(
              onPressed: () {
                Get.to(() => const LoginView(),
                    transition: Transition.leftToRightWithFade,
                    duration: const Duration(milliseconds: 700));
              },
              text: 'LOGIN',
              backgroundColor: AppColors.kPrimaryColor,
              textColor: Colors.white),
          const SizedBox(
            height: 18,
          ),
          DefaultButton(
              onPressed: () {
                Get.to(() => const SignupView(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 700));
              },
              text: 'SIGNUP',
              backgroundColor: AppColors.kLightColor,
              textColor: Colors.black.withOpacity(0.7)),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

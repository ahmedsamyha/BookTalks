import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytask/modules/home/presentation/views/home_view.dart';

import '../aouth/presentation/views/main_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(
          FirebaseAuth.instance.currentUser == null
              ? const MainView()
              : const HomeView(),
          transition: Transition.fadeIn,
          duration: const Duration(seconds: 1));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: height * .38,
              width: width * .38,
              child: Center(
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
          ),
          SizedBox(
            height: height * .1,
          )
        ],
      ),
    );
  }
}

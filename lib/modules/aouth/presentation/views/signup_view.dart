import 'package:flutter/material.dart';

import '../widgets/signup_background.dart';
import '../widgets/signup_list_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [SignUpBackground(), SignupListView()],
      ),
    );
  }
}

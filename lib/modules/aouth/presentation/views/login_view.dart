import 'package:flutter/material.dart';

import '../widgets/login_background.dart';
import '../widgets/login_list_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [LoginBackground(), LoginListView()],
      ),
    );
  }
}

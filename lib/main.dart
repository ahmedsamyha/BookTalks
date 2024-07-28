import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mytask/modules/aouth/data/data_source/aouth_cubit/auth_cubit.dart';
import 'package:mytask/modules/aouth/data/data_source/aouth_cubit/auth_state.dart';
import 'package:mytask/modules/home/data/data_source/firestore_cubit/firestore_cubit.dart';
import 'package:mytask/modules/home/data/data_source/firestore_cubit/firestore_states.dart';
import 'package:mytask/modules/splash_view/splash_view.dart';
import 'package:mytask/utility/constants/colors.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyTask());
}

class MyTask extends StatefulWidget {
  const MyTask({super.key});

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(
            '==================================User is currently signed out!');
      } else {
        print('==================================User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(AuthInitialState()),
        ),
        BlocProvider(
            create: (context) => FireStoreCubit(AddCategoryInitialState())),
        BlocProvider(
            create: (context) =>
                FireStoreCubit(AddCategoryInitialState())..getCategories()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.lightBackground,
              titleTextStyle: TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              iconTheme: IconThemeData(color: AppColors.kPrimaryColor)),
          scaffoldBackgroundColor: AppColors.lightBackground,
        ),
        home: const SplashView(),
      ),
    );
  }
}

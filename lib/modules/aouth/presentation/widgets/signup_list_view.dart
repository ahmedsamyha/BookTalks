import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mytask/modules/aouth/data/data_source/aouth_cubit/auth_cubit.dart';
import 'package:mytask/modules/aouth/data/data_source/aouth_cubit/auth_state.dart';
import 'package:mytask/modules/aouth/presentation/views/login_view.dart';
import 'package:mytask/modules/home/presentation/views/home_view.dart';
import 'package:mytask/utility/constants/colors.dart';

import 'default_button.dart';
import 'default_signup_icon.dart';
import 'default_text_form_field.dart';

class SignupListView extends StatefulWidget {
  const SignupListView({super.key});

  @override
  State<SignupListView> createState() => _SignupListViewState();
}

var nameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();
Future<void> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  if (googleUser == null) {
    return;
  }

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  // Once signed in, return the UserCredential
  await FirebaseAuth.instance.signInWithCredential(credential);
  Get.offAll(() => const HomeView());
}

class _SignupListViewState extends State<SignupListView> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state is RegisterLoadingState) {
            const CircularProgressIndicator();
          } else if (state is RegisterSuccessState) {
            await FirebaseAuth.instance.currentUser!.sendEmailVerification();

            WidgetsBinding.instance.addPostFrameCallback((_) {
              AwesomeDialog(
                btnCancelColor: const Color(0xfff44369),
                btnOkColor: AppColors.kPrimaryColor,
                dialogBackgroundColor: AppColors.lightBackground,
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.topSlide,
                title: 'INFO',
                desc: 'Please verify your email to sign in your account ',
                btnOkOnPress: () {
                  Get.offAll(const LoginView());
                },
              ).show();
            });
            if (FirebaseAuth.instance.currentUser!.emailVerified) {
              Get.to(() => const HomeView());
            } else {
              const CircularProgressIndicator();
            }
          } else if (state is RegisterFailureState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AwesomeDialog(
                btnCancelColor: const Color(0xfff44369),
                btnOkColor: AppColors.kPrimaryColor,
                dialogBackgroundColor: AppColors.lightBackground,
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.topSlide,
                title: 'Error',
                desc: state.errorMessage.toString(),
                btnOkOnPress: () {},
              ).show();
            });
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: height * .1,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'SIGNUP',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: width * .06,
                ),
                SvgPicture.asset(
                  'assets/icons/signup.svg',
                  height: height * 0.3,
                ),
                SizedBox(
                  height: height * .02,
                ),
                DefaultTextFormField(
                  controller: nameController,
                  hintText: 'Your Name',
                  keyboardType: TextInputType.text,
                  onChanged: (value) {},
                  obscureText: false,
                  onFieldSubmitted: (value) {},
                  onTap: () {},
                  prefixIcon: Icons.person,
                  validator: (value) {
                    return null;
                  },
                ),
                SizedBox(
                  height: height * .02,
                ),
                DefaultTextFormField(
                  controller: emailController,
                  hintText: 'Your Email',
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {},
                  onTap: () {},
                  prefixIcon: Icons.mail,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height * .02,
                ),
                DefaultTextFormField(
                  controller: passwordController,
                  hintText: 'Your Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {},
                  onTap: () {},
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.remove_red_eye,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height * .02,
                ),
                DefaultButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).userCreate(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    text: 'SIGNUP',
                    backgroundColor: AppColors.kPrimaryColor,
                    textColor: Colors.white),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an Account ?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.kPrimaryColor.withOpacity(.7)),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const LoginView(),
                              transition: Transition.leftToRightWithFade,
                              duration: const Duration(milliseconds: 700));
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.kPrimaryColor.withOpacity(.9)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: height * 0.01),
                  width: width * 0.8,
                  child: const Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: Color(0xFFD9D9D9),
                        height: 1.5,
                      )),
                      Text('OR',
                          style: TextStyle(
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.w600)),
                      Expanded(
                          child: Divider(
                        color: Color(0xFFD9D9D9),
                        height: 1.5,
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultSignUpIcon(
                        iconName: 'assets/icons/facebook.svg', onTap: () {}),
                    DefaultSignUpIcon(
                        iconName: 'assets/icons/twitter.svg', onTap: () {}),
                    DefaultSignUpIcon(
                        iconName: 'assets/icons/google-plus.svg',
                        onTap: () {
                          signInWithGoogle();
                        }),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

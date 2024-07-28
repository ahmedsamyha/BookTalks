import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mytask/modules/aouth/data/data_source/aouth_cubit/auth_cubit.dart';
import 'package:mytask/modules/aouth/data/data_source/aouth_cubit/auth_state.dart';
import 'package:mytask/modules/aouth/presentation/widgets/signup_list_view.dart';
import 'package:mytask/modules/home/presentation/views/home_view.dart';
import 'package:mytask/utility/constants/colors.dart';

import '../views/signup_view.dart';
import 'default_button.dart';
import 'default_signup_icon.dart';
import 'default_text_form_field.dart';

class LoginListView extends StatefulWidget {
  const LoginListView({super.key});

  @override
  State<LoginListView> createState() => _LoginListViewState();
}

var emailController = TextEditingController();

class _LoginListViewState extends State<LoginListView> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            const CircularProgressIndicator();
          } else if (state is LoginSuccessState) {
            if (FirebaseAuth.instance.currentUser!.emailVerified) {
              Get.to(() => const HomeView(),
                  transition: Transition.zoom,
                  duration: const Duration(milliseconds: 800));
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AwesomeDialog(
                  btnCancelColor: const Color(0xfff44369),
                  btnOkColor: AppColors.kPrimaryColor,
                  dialogBackgroundColor: AppColors.lightBackground,
                  context: context,
                  dialogType: DialogType.info,
                  animType: AnimType.topSlide,
                  title: '',
                  desc: 'Please verify your email and try again',
                  btnOkOnPress: () {},
                ).show();
              });
            }
          } else if (state is LoginFailureState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AwesomeDialog(
                btnCancelColor: const Color(0xfff44369),
                btnOkColor: AppColors.kPrimaryColor,
                dialogBackgroundColor: AppColors.lightBackground,
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.topSlide,
                title: 'Error',
                desc: 'No user found please try again!.',
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
                    'LOGIN',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ),
                SvgPicture.asset(
                  'assets/icons/login.svg',
                  height: height * 0.3,
                ),
                SizedBox(
                  height: width * .09,
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
                        BlocProvider.of<AuthCubit>(context).userLogin(
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    },
                    text: 'LOGIN',
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
                          Get.to(() => const SignupView(),
                              transition: Transition.leftToRightWithFade,
                              duration: const Duration(milliseconds: 700));
                        },
                        child: Text(
                          'Sign Up',
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

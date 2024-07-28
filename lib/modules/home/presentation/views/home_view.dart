import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mytask/modules/aouth/data/data_source/aouth_cubit/auth_cubit.dart';
import 'package:mytask/modules/aouth/data/data_source/aouth_cubit/auth_state.dart';
import 'package:mytask/modules/aouth/presentation/views/main_view.dart';
import 'package:mytask/modules/home/data/data_source/firestore_cubit/firestore_cubit.dart';
import 'package:mytask/modules/home/data/data_source/firestore_cubit/firestore_states.dart';
import 'package:mytask/modules/home/presentation/views/notes_view.dart';
import 'package:mytask/modules/home/presentation/widgets/add_folder_view.dart';
import 'package:mytask/modules/home/presentation/widgets/edit_category.dart';
import 'package:mytask/modules/home/presentation/widgets/folder_item.dart';
import 'package:mytask/utility/constants/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FireStoreCubit(GetCategoryInitialState())..getCategories(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(() => const AddFolderView(),
                    transition: Transition.downToUp,
                    duration: const Duration(milliseconds: 400));
              },
              backgroundColor: AppColors.kLightColor,
              child: const Icon(Icons.add),
            ),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text('Home'),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).userLogout();
                        Get.offAll(() => const MainView());
                      },
                      icon: const Icon(Icons.logout_outlined)),
                )
              ],
            ),
            body: BlocConsumer<FireStoreCubit, FireStoreStates>(
              listener: (context, state) {
                if (state is GetCategoryLoadingState) {
                  const Center(child: CircularProgressIndicator());
                } else if (state is GetCategoryFailureState) {
                  print('====================${state.errorMessage}');
                }
              },
              builder: (context, state) {
                var fireStoreCubit = BlocProvider.of<FireStoreCubit>(context);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: MasonryGridView.builder(
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) => FolderItem(
                      text: fireStoreCubit.categories[index]['categoryName'],
                      onTap: () {
                        Get.to(
                            () => NotesView(
                                  docId: fireStoreCubit.categories[index].id,
                                ),
                            transition: Transition.fadeIn,
                            duration: const Duration(milliseconds: 700));
                      },
                      onLongPress: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          AwesomeDialog(
                              btnCancelColor: AppColors.kPrimaryColor,
                              btnOkColor: Colors.pink,
                              dialogBackgroundColor: AppColors.lightBackground,
                              context: context,
                              dialogType: DialogType.info,
                              descTextStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                              animType: AnimType.topSlide,
                              desc: 'Select Your Choice',
                              btnCancelText: 'Edit',
                              btnOkText: 'Delete',
                              btnOkOnPress: () {
                                FirebaseFirestore.instance
                                    .collection('category')
                                    .doc(fireStoreCubit.categories[index].id)
                                    .delete();
                                Get.offAll(const HomeView(),
                                    transition: Transition.cupertinoDialog,
                                    duration:
                                        const Duration(milliseconds: 700));
                              },
                              btnCancelOnPress: () {
                                Get.to(
                                    () => EditCategoryView(
                                          docID: fireStoreCubit
                                              .categories[index].id,
                                          name: fireStoreCubit.categories[index]
                                              ['categoryName'],
                                        ),
                                    transition: Transition.rightToLeftWithFade,
                                    duration:
                                        const Duration(milliseconds: 700));
                              }).show();
                        });
                      },
                    ),
                    itemCount: fireStoreCubit.categories.length,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

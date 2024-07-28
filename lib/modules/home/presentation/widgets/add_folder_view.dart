import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mytask/modules/aouth/presentation/widgets/default_text_form_field.dart';
import 'package:mytask/modules/home/data/data_source/firestore_cubit/firestore_cubit.dart';
import 'package:mytask/modules/home/data/data_source/firestore_cubit/firestore_states.dart';
import 'package:mytask/modules/home/presentation/views/home_view.dart';

class AddFolderView extends StatefulWidget {
  const AddFolderView({super.key});

  @override
  State<AddFolderView> createState() => _AddFolderViewState();
}

var categoryNameController = TextEditingController();
var formKey = GlobalKey<FormState>();

class _AddFolderViewState extends State<AddFolderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('Add Category'),
      ),
      body: BlocConsumer<FireStoreCubit, FireStoreStates>(
        listener: (context, state) {
          if (state is AddCategoryLoadingState) {
            const Center(child: CircularProgressIndicator());
          } else if (state is AddCategorySuccessState) {
            Get.offAll(() => const HomeView());
            categoryNameController.clear();
          } else if (state is AddCategoryFailureState) {
            print('=====================${state.errorMessage.toString()}');
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                DefaultTextFormField(
                  color: Colors.blueGrey.shade400.withOpacity(.1),
                  obscureText: false,
                  validator: (value) {
                    if (value == '') {
                      return 'Name Can\'t be Empty ';
                    }
                    return null;
                  },
                  prefixIcon: Icons.title_outlined,
                  onChanged: (value) {},
                  hintText: 'Enter Name',
                  onFieldSubmitted: (value) {},
                  keyboardType: TextInputType.text,
                  controller: categoryNameController,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<FireStoreCubit>(context).addCategory(
                            name: categoryNameController.text,
                            userID: FirebaseAuth.instance.currentUser!.uid);
                      }
                    },
                    child: const Text(
                      ' + Add ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mytask/modules/aouth/presentation/widgets/default_text_form_field.dart';
import 'package:mytask/modules/home/data/data_source/firestore_cubit/firestore_cubit.dart';
import 'package:mytask/modules/home/data/data_source/firestore_cubit/firestore_states.dart';
import 'package:mytask/modules/home/presentation/views/home_view.dart';

class EditCategoryView extends StatefulWidget {
  const EditCategoryView({super.key, required this.docID, required this.name});
  final String docID;
  final String name;
  @override
  State<EditCategoryView> createState() => _EditCategoryViewState();
}

var categoryNewNameController = TextEditingController();
var formKey = GlobalKey<FormState>();

class _EditCategoryViewState extends State<EditCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
              categoryNewNameController.clear();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('Edit Category'),
      ),
      body: BlocConsumer<FireStoreCubit, FireStoreStates>(
        listener: (context, state) {
          if (state is UpdateCategoryLoadingState) {
            const Center(child: CircularProgressIndicator());
          } else if (state is UpdateCategorySuccessState) {
            Get.offAll(() => const HomeView());
            categoryNewNameController.clear();
          } else if (state is UpdateCategoryFailureState) {
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
                  hintText: widget.name,
                  onFieldSubmitted: (value) {},
                  keyboardType: TextInputType.text,
                  controller: categoryNewNameController,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<FireStoreCubit>(context).updateCategory(
                            categoryID: widget.docID,
                            categoryName: categoryNewNameController.text);
                      }
                    },
                    child: const Text(
                      ' Save ',
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

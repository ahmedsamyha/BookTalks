import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mytask/utility/constants/colors.dart';

class NoteItem extends StatelessWidget {
  const NoteItem(
      {super.key,
      required this.title,
      required this.content,
      this.btnOkOnPress,
      this.onEditPressed});
  final String title;
  final String content;
  final void Function()? btnOkOnPress;
  final void Function()? onEditPressed;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(left: 24),
      height: height * .22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xffe7ecef),
        boxShadow: [
          BoxShadow(
            color: AppColors.kPrimaryColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 24, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                    height: height * .13,
                    child: ListView(
                      children: [
                        Text(
                          content,
                          style: const TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff3a506b)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * .22,
            width: height * .05,
            child: Column(
              children: [
                Container(
                  height: height * .045,
                  width: width * .11,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(.1),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(8)),
                  ),
                  child: Center(
                    child: IconButton(
                        onPressed: () {
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
                              desc: 'Do You Want to Delete Note',
                              btnCancelText: 'Edit',
                              btnOkText: 'Delete',
                              btnOkOnPress: btnOkOnPress,
                            ).show();
                          });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Color(0xffe71d36),
                        )),
                  ),
                ),
                SizedBox(
                  height: height * .13,
                ),
                Container(
                  height: height * .045,
                  width: width * .11,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(.1),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(8)),
                  ),
                  child: Center(
                    child: IconButton(
                        onPressed: onEditPressed,
                        icon: const Icon(
                          Icons.edit,
                          color: Color(0xff1d4e89),
                        )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

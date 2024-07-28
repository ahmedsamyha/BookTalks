import 'package:flutter/material.dart';
import 'package:mytask/utility/constants/colors.dart';

class FolderItem extends StatelessWidget {
  const FolderItem(
      {super.key,
      required this.text,
      required this.onTap,
      required this.onLongPress});
  final String text;
  final void Function()? onTap;
  final void Function()? onLongPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      highlightColor: AppColors.kLightColor.withOpacity(.5),
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.only(top: 6, bottom: 12),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.lightBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset('assets/images/folder.png'),
            Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(.7)),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mytask/utility/constants/colors.dart';

class DefaultSignUpIcon extends StatelessWidget {
  const DefaultSignUpIcon({
    super.key,
    required this.iconName,
    required this.onTap,
  });
  final String iconName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      highlightColor: AppColors.kLightColor.withOpacity(.8),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.kLightColor),
            shape: BoxShape.circle),
        child: SvgPicture.asset(
          iconName,
          width: 24,
          height: 24,
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}

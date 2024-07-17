import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/theme/theme.dart';

class BoxButton extends StatelessWidget{
  final String title;
  final bool disabled;
  final void Function() ? onTap;
  final bool busy;  
  final Widget? leading;
  final bool outline;

  const BoxButton({
    super.key,
    required this.title,
    this.disabled = false,
    this.onTap,
    this.busy = false,
    this.leading,
  }) : outline= false;
  
  const BoxButton.outline({
    super.key, 
    required this.title,
    this.onTap,
    this.leading,
  })  : disabled = false,
        busy = false,
        outline = true;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: double.infinity,
        height: 36,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: !outline 
        ? BoxDecoration(
          color: !disabled ? AppColor.buttonColorLight : AppColor.buttonDisableColorLight,
          borderRadius: BorderRadius.circular(12),
        )
        : BoxDecoration(
          color: AppColor.buttonOutlineLight,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColor.buttonOutlineLight,
            width: 1,
          )
        ) ,
        
        child: !busy 
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (leading != null) leading!,
                if (leading == null) const SizedBox(width: 5),
                Text(
                  title,
                  style: AppText.bodyStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: !outline ? AppColor.textColorLight : AppColor.textOutlineColorLight,
                  )
                ),
              ],
            )
          : const CircularProgressIndicator(
            strokeWidth: 8,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          )
      ),
    );
  }
}
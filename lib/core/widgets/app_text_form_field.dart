import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      this.enabledBorder,
      this.focusedBorder,
      required this.hintText,
      this.contentPadding,
      this.backgroundColor,
      this.hintStyle,
      this.textStyle,
      this.isObscureText,
      this.suffixIcon,
      this.prefixIcon,
      this.controller,
      this.maxLines,
      this.inputFormatters,
      this.onChange,
      this.borderRadius,
      this.textInputType,
      this.isScrollPadding = false,
      required this.validator});

  final InputBorder? enabledBorder, focusedBorder;
  final String hintText;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final TextStyle? hintStyle, textStyle;
  final bool? isObscureText;
  final Widget? suffixIcon, prefixIcon;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Function(String value)? onChange;
  final double? borderRadius;
  final bool isScrollPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      onChanged: (value) {
        if (onChange != null) {
          onChange!(value);
        }
      },
      style: textStyle ?? TextStyles.font13BlackMedium,
      obscureText: isObscureText ?? false,
      cursorColor: ColorsManager.mainGreen,
      maxLines: maxLines ?? 1,
      keyboardType: textInputType ?? TextInputType.text,
      inputFormatters: inputFormatters ?? [],
      scrollPadding: EdgeInsets.only(
          bottom:
              isScrollPadding ? MediaQuery.of(context).viewInsets.bottom : 0),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 35),
              borderSide:
                  const BorderSide(color: ColorsManager.mainGreen, width: 0.6),
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 35),
          borderSide: const BorderSide(color: Colors.grey, width: 0.6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 35),
          borderSide: const BorderSide(color: Colors.red, width: 0.6),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 35),
          borderSide: const BorderSide(color: Colors.red, width: 0.6),
        ),
        suffixIcon: suffixIcon ?? const SizedBox(),
        prefixIcon: prefixIcon,
        hintStyle: hintStyle ?? TextStyles.font13GreyMedium,
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

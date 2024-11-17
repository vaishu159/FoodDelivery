import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/components/common_text.dart';
import 'package:food_delivery/components/app_colors.dart';

class CommonTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextInputType? keyBoardType;
  final TextEditingController? con;
  final bool? readOnly;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final bool? isDense;
  final Function()? onEditingComplete;
  final Function(String)? onChanged;
  final String? labelText;
  final String? suffixImage;
  final Color? suffixColor;
  final void Function()? suffixOnTap;
  final Widget? prefixIcon;
  final Widget? prefix;
  final double? constraintHeight;
  final TextStyle? labelStyle;
  final String? hintText;
  final String? headerLabel;
  final TextStyle? hintStyle;
  final int? maxLine;
  final int? maxLength;

  const CommonTextField({
    super.key,
    this.keyBoardType,
    this.con,
    this.validator,
    this.readOnly,
    this.onTap,
    this.inputFormatters,
    this.obscureText,
    this.isDense,
    this.onEditingComplete,
    this.onChanged,
    this.labelText,
    this.suffixImage,
    this.suffixColor,
    this.suffixOnTap,
    this.prefixIcon,
    this.constraintHeight,
    this.labelStyle,
    this.hintText,
    this.headerLabel,
    this.hintStyle,
    this.prefix,
    this.maxLine,
    this.maxLength,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (headerLabel != null)
          CommonText(
            text: headerLabel,
            fontWeight: FontWeight.w700,
          ),
        TextFormField(
          controller: con,
          keyboardType: keyBoardType,
          validator: validator,
          readOnly: readOnly ?? false,
          onTap: onTap,
          enabled: true,
          obscureText: obscureText ?? false,
          inputFormatters: inputFormatters,
          cursorColor: AppColor.black,
          cursorErrorColor: Colors.red,
          onEditingComplete: onEditingComplete,
          onChanged: onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              constraints: BoxConstraints(
                  maxHeight: constraintHeight ?? double.infinity),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.black.withOpacity(0.15)),
              ),
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColor.black.withOpacity(0.15))),
              isDense: true,
              hintText: hintText,
              hintStyle: hintStyle,
              labelStyle: labelStyle ?? const TextStyle(color: AppColor.black),
              labelText: labelText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixImage != null
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                          onTap: suffixOnTap,
                          child: Image.asset(suffixImage ?? "",
                              color: suffixColor)),
                    )
                  : const SizedBox()),
        ),
      ],
    );
  }
}

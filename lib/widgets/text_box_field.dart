import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_task/utils/custom_extensions.dart';

class TextBoxField extends StatelessWidget {
  const TextBoxField({
    required this.controller,
    super.key,
    this.label,
    this.prefix,
    this.suffix,
    this.isEnabled = true,
    this.hintText,
    this.keyBoardType,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.onSubmit,
    this.onTap,
    this.onValueChnaged,
    this.maxLines = 1,
    this.minLines,
    this.inputFormatter,
    this.autoValidate,
    this.fillColor,
    this.textAlign,
    this.decoration,
  });
  final String? label;
  final int? maxLines;
  final int? minLines;
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyBoardType;
  final String? Function(String?)? validator;
  final bool isEnabled;
  final Color? fillColor;

  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? suffixIcon;
  final InputDecoration? decoration;
  final TextAlign? textAlign;

  final AutovalidateMode? autoValidate;
  final void Function(String)? onSubmit;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final void Function(String)? onValueChnaged;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          textInputAction: TextInputAction.next,
          style: context.textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.w400),
          autovalidateMode: autoValidate,
          maxLines: maxLines,
          onChanged: (value) {
            onValueChnaged?.call(value);
          },
          textAlign: textAlign ?? TextAlign.start,
          enabled: isEnabled,
          validator: validator,
          onFieldSubmitted: onSubmit,
          onTap: onTap,
          focusNode: focusNode,
          keyboardType: keyBoardType,
          controller: controller,
          minLines: minLines,
          cursorColor: context.theme.primaryColor,
          cursorWidth: 1.5,
          decoration: decoration ??
              InputDecoration(
                hintText: hintText ?? label,
                prefixIcon: prefixIcon,
                prefix: prefix,
                suffix: suffix,
                suffixIcon: suffixIcon,
              ),
        ),
      ],
    );
  }
}

import 'package:dispute_system/theme.dart';
import 'package:flutter/material.dart';
class MainTextInput extends StatelessWidget {
  const MainTextInput(
      {super.key,
      this.labelText,
      this.controller,
      this.mainText,
      this.obscureText = false,
      this.maxLine,
      this.prefixWidget,
      this.suffixWidget,
      this.onTap,
      this.keyboardType,
      this.maxLength,
      this.isFilled,
      this.readOnly,
      this.icon,
      this.divider,
      this.prefixText});
  final String? labelText;
  final String? prefixText;
  final Widget? icon;

  final String? mainText;
  final int? maxLine;
  final Widget? prefixWidget;
  final bool? isFilled;
  final TextEditingController? controller;
  final Widget? suffixWidget;
  final VoidCallback? onTap;
  final bool? readOnly;
  final bool? obscureText;

  final bool? divider;
  final TextInputType? keyboardType;
  final int? maxLength;
  @override
  Widget build(final BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            mainText.toString(),
            style: TextStyles()
                .defaultText(16, FontWeight.w600, themes().secondaryColor),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            obscureText: obscureText!,
            readOnly: readOnly ?? false,
            maxLength: maxLength,
            keyboardType: keyboardType,
            maxLines: maxLine ?? 1,
            onTap: onTap,
            decoration: InputDecoration(
              icon: icon,
              prefix: prefixWidget,
              hintText: labelText,
              filled: isFilled,
              fillColor: themes().appBarColor,
              prefixText: prefixText,
              suffixIcon: suffixWidget,
              hintStyle: TextStyles().greyTextStyle400(),
              //suffix: suffixWidget,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffB8C9C9),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffB8C9C9),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffB8C9C9),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffB8C9C9),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Visibility(
            visible: divider ?? false,
            child: Column(
              children: [
                SizedBox(
                  height: 0,
                ),
                Divider(
                  color: Color.fromARGB(255, 214, 221, 235),
                  thickness: 1,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          )
        ],
      );
}

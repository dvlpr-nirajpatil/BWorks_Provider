import 'package:billionworks/consts/color_pallate.dart';
import 'package:billionworks/consts/images_icons.dart';
import 'package:billionworks/consts/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      this.label,
      this.isPass = false,
      this.suffixIcon,
      this.controller,
      this.readOnly = false});

  bool readOnly;
  String? label;
  bool isPass;
  Widget? suffixIcon;
  TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Widget? suffixIcon;

  bool show_pass = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        readOnly: widget.readOnly,
        controller: widget.controller,
        obscureText: widget.isPass == false
            ? false
            : widget.isPass && show_pass
                ? false
                : true,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: AppColors.primary),
          suffixIcon: widget.isPass
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      show_pass = !show_pass;
                    });
                  },
                  icon: SvgPicture.asset(
                    AssetsUrl.hideIcon,
                    width: 15,
                  ),
                )
              : widget.suffixIcon,
          hintStyle: TextStyle(color: AppColors.bodyColour),
          filled: true,
          fillColor: Colors.black.withOpacity(0.035),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          suffix: suffixIcon,
          label: Text(widget.label ?? "Label"),
          labelStyle: TextStyle(
              fontSize: 14,
              fontFamily: Typo.medium,
              color: AppColors.bodyColour),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}

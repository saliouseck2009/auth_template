import 'package:flutter/material.dart';

import '../../../../../themes/theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
        required this.controller,
        required this.textInputAction,
        required this.icon,
        required this.keyboardType,
        this.validator,
        this.obscureText,
        required this.label})
      : super(key: key);

  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String label;
  final Widget? icon;
  final bool? obscureText;
  final VoidCallbackWithStringArgs? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: const TextStyle(
            fontSize: 16.0,
            color: CustomColors.mainColor,
            fontWeight: FontWeight.bold),
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: icon,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: CustomColors.mainColor),
              borderRadius: BorderRadius.circular(5.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: CustomColors.mainColor),
              borderRadius: BorderRadius.circular(05.0)),
          contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
          labelText: label,
          hintStyle: const TextStyle(
              fontSize: 12.0,
              color: CustomColors.mainColor,
              fontWeight: FontWeight.w500),
          labelStyle: const TextStyle(
              fontSize: 15.0,
              color: CustomColors.mainColor,
              fontWeight: FontWeight.w500),
        ),
        autocorrect: false,
        validator: validator,
        obscureText: obscureText ?? false);
  }
}

///Création d'un type de fonction prennant un String comme argument.
typedef VoidCallbackWithStringArgs = String? Function(String?)?;

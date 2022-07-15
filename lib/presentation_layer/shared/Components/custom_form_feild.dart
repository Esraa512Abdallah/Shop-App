import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  Function onSubmit;
  Function onChange;
  Function onTap;
  bool isPassword = false;
 // Function(String?)? validate;
  String label;
  IconData prefix;
  IconData? suffix;
  Function? suffixPressed;
  bool isClickable = true;


  String? _errorMessage(String str) {
    switch (label) {
      case 'Email Address':
        return 'Please enter your email address !';
      case 'PassWord':
        return 'Please enter your PassWord!';
      // case 'Enter your password':
      //   return 'Password is empty !';
    }
  }

  DefaultTextFormField({
    required this.controller,
    required this.type,
    required this.onSubmit,
    required this.onChange,
    required this.onTap,
    this.isPassword = false,
    //required this.validate,
    required this.label,
    required this.prefix,
    this.suffix,
    this.suffixPressed,
    this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit(),
      onChanged: onChange(),
      onTap: onTap(),
      validator: (value) {
        if (value!.isEmpty) {
          return _errorMessage(label);
        }
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed!(),
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sali/Utils/Common_style.dart';
import '../main.dart';

class CommonTextInput extends StatelessWidget {
  final String hintTitle;
  final TextInputType keyboardType;
  final Function checkvalidations;
  final Function fieldSubmitted;
  final TextEditingController controller;
  final TextInputFormatter inputFormatter;

  CommonTextInput({
    required this.hintTitle,
    required this.keyboardType,
    required this.checkvalidations,
    required this.controller,
    required this.inputFormatter,
    required this.fieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();

    return TextFormField(
      autofocus: true,
      key: _formKey,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: (value) {
        print('search: $value');
        fieldSubmitted(value);
      },
      textDirection: language.value == 'en' ? TextDirection.ltr:TextDirection.rtl,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedErrorBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        hintText: hintTitle,
        hintStyle: TextStyle(
          color: Colors.black26,
          fontSize: 18,
        ),
        fillColor: Colors.white,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        filled: true,
      ),
      style: const TextStyle(fontSize: 18),
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      validator: (value) => checkvalidations(value),
      inputFormatters: [inputFormatter],
      textInputAction: TextInputAction.search,
    );
  }
}

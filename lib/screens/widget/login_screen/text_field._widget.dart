import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({Key? key, this.hintText, this.onChange, this.validator})
      : super(key: key);
  String? hintText;
  Function(String)? onChange;
  GlobalKey<FormState>? formKey = GlobalKey();
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        onChanged: onChange,
        validator: validator,
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.red,
            hintText: hintText ?? '',
            hintStyle: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            )),
      ),
    );
  }
}

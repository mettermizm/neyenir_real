import 'package:flutter/material.dart';
import 'default_text_form_field.dart';

/// A text form field that hides the text and has a button to toggle the visibility
class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    Key? key,
    required this.controller,
    required this.title,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String title;
  @override
  PasswordTextFormFieldState createState() => PasswordTextFormFieldState();
}

class PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _isObscure = true;

  void _changeObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextFormField(
      title: widget.title,
      controller: widget.controller,
      obscure: _isObscure,
      suffix: IconButton(
        icon: _isObscure ? const Icon(Icons.lock) : const Icon(Icons.lock_open),
        onPressed: _changeObscure,
      ),
      textInputType: TextInputType.streetAddress,
      validator: widget.validator,
    );
  }
}

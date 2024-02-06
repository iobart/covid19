import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final FormFieldValidator<String> validator;
  final bool isPassword;
  final void Function(String) onChange;
  CustomTextField({
    required this.label,
    required this.validator,
    required this.onChange, this.isPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label),
          TextFormField(
            onChanged: widget.onChange,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: widget.isPassword
                  ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: _togglePasswordVisibility,
              )
                  : null,
            ),
            validator: widget.validator,
            obscureText: widget.isPassword ? _obscureText : false,
          ),
        ],
      ),
    );
  }
}

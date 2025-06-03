import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String? label;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const CustomTextfield({
    super.key,
    this.label,
    this.prefixIcon,
    this.keyboardType,
    this.isPassword,
    this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _obsucredText = true;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword == true ? _obsucredText : false,
      validator: widget.validator,
      onChanged: widget.onChanged,
      style: AppTextstyles.withColor(
        AppTextstyles.bodyMedium,
        Theme.of(context).textTheme.bodyLarge!.color!,
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: AppTextstyles.withColor(
          AppTextstyles.bodyMedium,
          isDark ? Colors.white54 : Colors.black54,
        ),
        prefixIcon: Icon(widget.prefixIcon,
            color: isDark ? Colors.white54 : Colors.black54),
        suffixIcon: widget.isPassword == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obsucredText = !_obsucredText;
                  });
                },
                icon: Icon(
                  _obsucredText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: isDark ? Colors.white54 : Colors.black54,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: isDark ? Colors.white54 : Colors.black54,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    );
  }
}

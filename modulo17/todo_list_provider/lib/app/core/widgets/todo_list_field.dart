import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/todo_list_icons.dart';

class TodoListField extends StatelessWidget {
  TodoListField({ 
    Key? key,
    required this.label,
    this.obscureText = false,
    this.suffixIconButton,
    this.controller,
    this.validator,
    this.focusNode,
  }) : 
    assert(
      obscureText == true ? suffixIconButton== null : true,
      'obscureText não pode ser enviado em conjunto com suffixIconButton'
    ),
    obscureTextVN = ValueNotifier(obscureText),
    super(key: key);

  final String label;
  final IconButton? suffixIconButton;
  final bool obscureText;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextVN,
      builder: (context, obscureTextValue, _) {
        return TextFormField(
          focusNode: focusNode,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            labelText: label,
            alignLabelWithHint: true,
            labelStyle: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.red)
            ),
            isDense: true,
            suffixIcon: suffixIconButton ?? (obscureText == true ? IconButton(
              icon: Icon(
                (!obscureTextValue ? TodoListIcons.eye_slash : TodoListIcons.eye),
                size: 15,
              ),
              onPressed: () {
                obscureTextVN.value = !obscureTextValue;
              },
            ) : null),
          ),
          obscureText: obscureTextValue,
        );
      }
    );
  }
}
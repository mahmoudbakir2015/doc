import 'package:flutter/material.dart';

Widget defaultTextForm({
  Widget? flag,
  Widget? widget,
  bool notMobile = true,
  required String label,
  required TextEditingController controller,
  bool obscureText = false,
  required TextInputType textInputType,
  bool isSuffix = false,
  void Function(String)? onSubmitted,
  void Function(String)? onChange,
  required String? Function(String?)? onValidate,
  void Function()? onTap,
}) =>
    TextFormField(
      onFieldSubmitted: onSubmitted,
      onChanged: onChange,
      validator: onValidate,
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: notMobile ? widget : flag,
        labelText: label,
        suffixIcon: isSuffix
            ? GestureDetector(
                onTap: onTap,
                child: obscureText
                    ? const Icon(
                        Icons.visibility_off,
                      )
                    : const Icon(
                        Icons.visibility,
                      ),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );
void navigateTo({
  required BuildContext context,
  required Widget widget,
}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

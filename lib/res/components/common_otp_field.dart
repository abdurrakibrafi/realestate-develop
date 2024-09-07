import 'package:flutter/material.dart';

Widget buildOTPTextField(
    TextEditingController controller, int index, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.yellow.shade50, borderRadius: BorderRadius.circular(10)),
    width: 50,
    height: 50,
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      cursorColor: Colors.black,
      style: const TextStyle(fontSize: 20),
      maxLength: 1,
      decoration: InputDecoration(
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: (value) {
        if (value.length == 1 && index < 5) {
          FocusScope.of(context).nextFocus();
        } else if (value.isEmpty && index > 0) {
          FocusScope.of(context).previousFocus();
        }
      },
    ),
  );
}

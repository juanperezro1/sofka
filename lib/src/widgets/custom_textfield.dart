import 'package:flutter/material.dart';
import 'package:prueba/src/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required TextEditingController textEditingController,
  }) : _textEditingController = textEditingController, super(key: key);

  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      style: const TextStyle(fontSize: 22, color: Colors.white),
      decoration: const InputDecoration(
        filled: true,
        fillColor: kPrimaryColor,
        hintText: "Full Name",
        hintStyle: TextStyle(color: Colors.white, fontFamily: 'Sofia Pro'),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
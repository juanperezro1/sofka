import 'package:flutter/material.dart';
import 'package:prueba/src/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required TextEditingController textEditingController,
  })  : _textEditingController = textEditingController,
        super(key: key);

  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
          controller: _textEditingController,
          style: const TextStyle(fontSize: 22, color: Colors.black),
          cursorColor: kPrimaryColor,
          decoration: const InputDecoration(
            hintText: "Full Name",
            hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Sofia Pro'),
            border: InputBorder.none,
          )),
    );
  }
}

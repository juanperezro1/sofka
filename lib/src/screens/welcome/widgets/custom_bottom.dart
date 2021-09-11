import 'package:flutter/material.dart';
import 'package:prueba/src/utils/constants.dart';

class CustomBottom extends StatelessWidget {
  final VoidCallback onPressed;
  final Text text;
  const CustomBottom({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: MaterialButton(
          onPressed: onPressed,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const StadiumBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                text,
              ],
            ),
          )),
    );
  }
}

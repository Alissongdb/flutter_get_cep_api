import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  const DefaultButton({
    Key? key,
    required this.textColor,
    required this.buttonColor,
    required this.text,
    required this.function,
  }) : super(key: key);

  final Color textColor;
  final Color buttonColor;
  final String text;
  final Function function;

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: widget.buttonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onTap: () => widget.function(),
      ),
    );
  }
}

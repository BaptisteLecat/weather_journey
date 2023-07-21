import 'package:flutter/material.dart';

class SecondaryButton extends StatefulWidget {
  final Widget? content;
  final bool isSubmitable;
  final Function() onSubmit;
  const SecondaryButton(
      {Key? key,
      required this.onSubmit,
      this.content,
      this.isSubmitable = false})
      : super(key: key);

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (widget.isSubmitable) ? widget.onSubmit : null,
      child: Container(
          height: 54,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffB5BDD7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: (widget.content != null)
              ? widget.content
              : Center(
                  child: Text("Submit",
                      style: Theme.of(context).textTheme.headline6),
                )),
    );
  }
}

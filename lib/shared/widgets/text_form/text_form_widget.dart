import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {
  final String hintText;
  final String title;
  final void Function(String value) onChanged;

  const TextFormWidget({
    Key? key,
    required this.hintText,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  var inputProductController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              widget.title,
            ),
          ),
          TextFormField(
            controller: inputProductController,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
                hintText: widget.hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(25),
                )),
          ),
        ],
      ),
    );
  }
}

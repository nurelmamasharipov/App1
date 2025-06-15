import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onTap,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat',
          ),
        ),
        const SizedBox(height: 2),
        Container(
          height: 30,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1.0),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              keyboardType: keyboardType,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Montserrat'),
              decoration: const InputDecoration(
                hintText: '',
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: onChanged,
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
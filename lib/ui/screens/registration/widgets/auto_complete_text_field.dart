import 'package:flutter/material.dart';

class AutoCompleteTextField extends StatelessWidget {
  const AutoCompleteTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    required this.hintText,
    required this.suggestions,
    required this.showDropdown,
    required this.onChanged,
    required this.onSuggestionSelected,
    required this.onTapSuffixIcon,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final String hintText;
  final List<String> suggestions;
  final bool showDropdown;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSuggestionSelected;
  final GestureTapCallback onTapSuffixIcon;

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
              onChanged: onChanged,
              onTap: () => focusNode.requestFocus(),
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Montserrat'),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 18, fontFamily: 'Montserrat'),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                suffixIcon: GestureDetector(
                  onTap: onTapSuffixIcon,
                  child: AnimatedRotation(
                    turns: showDropdown ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
                  ),
                ),
              ),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: Container(
            height: showDropdown && suggestions.isNotEmpty
                ? (suggestions.length > 2 ? 2 : suggestions.length) * 44.0
                : 0,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: suggestions.length > 2 ? 2 : suggestions.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => onSuggestionSelected(suggestions[index]),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                    child: Text(suggestions[index], style: const TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Montserrat')),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

class VerificationDetailField extends StatelessWidget {
  const VerificationDetailField({
    Key? key,
    required this.labelText,
    required this.valueText,
    this.isStreetField = false,
  }) : super(key: key);

  final String labelText;
  final String valueText;
  final bool isStreetField;

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
        const SizedBox(height: 4),
        Container(
          height: 30,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1.0),
            ),
          ),
          child: isStreetField
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  valueText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  image: const DecorationImage(
                    image: NetworkImage('https://placehold.co/24x24/E0E0E0/FFFFFF?text=PIC'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          )
              : Align(
            alignment: Alignment.centerLeft,
            child: Text(
              valueText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
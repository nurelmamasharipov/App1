import 'package:flutter/material.dart';

class AddObjectCard extends StatelessWidget {
  final VoidCallback onTap;

  const AddObjectCard({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      // margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'ДОБАВИТЬ\nОБЪЕКТ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 8),
              Image.asset(
                'assets/icons/plus_box.png',
                width: 30,
                height: 30,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
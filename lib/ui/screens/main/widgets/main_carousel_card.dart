import 'package:flutter/material.dart';
import 'package:random_app/ui/screens/main/models/main_screen__item.dart';

class MainCarouselCard extends StatelessWidget {
  final MainScreenItem item;

  const MainCarouselCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xCC1C8ECE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.fio,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.eni,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
    );
  }
}
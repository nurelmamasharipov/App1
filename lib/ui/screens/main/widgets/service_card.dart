import 'package:flutter/material.dart';

import '../models/service_item.dart';

class ServiceCard extends StatelessWidget {
  final ServiceItem item;

  const ServiceCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.fromLTRB(16, 12, 10, 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6E9),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFF8F8F8),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: const TextStyle(
              color: Color(0xFF1D1D1F),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              _buildInfoColumn('Город', item.city),
              const SizedBox(width: 32),
              _buildInfoColumn('Улица', item.street),
              const SizedBox(width: 32),
              _buildInfoColumn('Номер', item.houseNumber),
            ],
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              _buildInfoColumn('Cуб-лицевой счет', item.accountNumber),
              const SizedBox(width: 32),
              _buildInfoColumn('Задолженность', '${item.debt} сом',
                  valueColor: const Color(0xFF1D1D1F)),
            ],
          ),

          const SizedBox(height: 6),

          Align(
            alignment: Alignment.centerRight,
            child: _buildGoToButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildGoToButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Нажата кнопка Перейти для: ${item.title}');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: const StadiumBorder(),
        minimumSize: const Size(0, 24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Перейти',
            style: TextStyle(
              color: Color(0xFF1D1D1F),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(width: 4),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value,
      {Color valueColor = const Color(0xFF1D1D1F)}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat',
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat',
          ),
        ),
      ],
    );
  }
}
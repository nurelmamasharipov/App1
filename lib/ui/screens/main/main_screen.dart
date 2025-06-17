import 'package:flutter/material.dart';
import 'package:random_app/ui/screens/main/models/main_screen__item.dart';
import 'package:random_app/ui/screens/main/widgets/main_carousel_card.dart';
import 'package:random_app/ui/screens/main/widgets/add_object_card.dart';
import 'package:random_app/ui/screens/main/widgets/service_card.dart';

import 'models/service_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<MainScreenItem> _items = [
    const MainScreenItem(
      title: 'Г. ТОКМОК\nУЛ. ЛЕНИНА, Д. 256, КВ. 31',
      fio: 'ФИО: Д****** П****** И******',
      eni: 'ЕНИ: 123456789123456',
    ),
    const MainScreenItem(
      title: 'Г. БИШКЕК\nУЛ. СОВЕТСКАЯ, Д. 10, КВ. 5',
      fio: 'ФИО: А****** А****** А******',
      eni: 'ЕНИ: 987654321098765',
    ),
  ];

  final List<ServiceItem> _serviceItems = [
    const ServiceItem(
      title: 'МП “ТОКМОК ВОДОКАНАЛ”',
      city: 'Токмок',
      street: 'Ленина',
      houseNumber: '256, кв.31',
      accountNumber: '12100558-4',
      debt: '1200,00',
    ),
    const ServiceItem(
      title: 'МП “ТОКМОК ТАЗАЛЫК”',
      city: 'Токмок',
      street: 'Ленина',
      houseNumber: '256, кв.31',
      accountNumber: '132323-1',
      debt: '535,20',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 150,
                    child: PageView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        final item = _items[index];
                        return MainCarouselCard(item: item);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                AddObjectCard(
                  onTap: () {
                    print('ДОБАВИТЬ ОБЪЕКТ нажато');
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _serviceItems.length,
              itemBuilder: (context, index) {
                final serviceItem = _serviceItems[index];
                return ServiceCard(item: serviceItem);
              },
            ),
          ),
        ],
      ),
    );
  }
}
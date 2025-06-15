import 'package:flutter/material.dart';
import 'package:random_app/ui/screens/main/models/main_screen__item.dart';
import 'package:random_app/ui/screens/main/widgets/main_carousel_card.dart';
import 'package:random_app/ui/screens/main/widgets/add_object_card.dart';

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
          const Expanded(
            child: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:random_app/ui/screens/main/main_screen.dart';
import 'package:random_app/ui/screens/data_verification/widgets/verification_detail_field.dart';

class DataVerificationScreen extends StatelessWidget {
  final String city;
  final String street;
  final String house;
  final String apartment;

  const DataVerificationScreen({
    Key? key,
    required this.city,
    required this.street,
    required this.house,
    required this.apartment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Регистрация',
          style: TextStyle(
            color: Color(0xFF4A90E2),
            fontSize: 17,
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  VerificationDetailField(
                    labelText: 'Город:',
                    valueText: city,
                    isStreetField: false,
                  ),
                  const SizedBox(height: 30),

                  VerificationDetailField(
                    labelText: 'Улица:',
                    valueText: street,
                    isStreetField: false,
                  ),
                  const SizedBox(height: 30),

                  VerificationDetailField(
                    labelText: 'Номер дома:',
                    valueText: house,
                    isStreetField: false,
                  ),
                  const SizedBox(height: 30),

                  VerificationDetailField(
                    labelText: 'Номер квартиры:',
                    valueText: apartment,
                    isStreetField: false,
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                        value: true,
                        onChanged: (bool? newValue) {},
                        activeColor: const Color(0xFF424242),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'Я прочитал и согласен с пользовательским соглашением, политикой конфиденциальности и согласием на сбор и обработку персональных \nданных',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 11,
                          fontFamily: 'Montserrat',
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 64,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1C8ECE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      padding: EdgeInsets.zero,
                      elevation: 2,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Center(
                          child: Text(
                            'СОХРАНИТЬ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              width: 52,
                              height: 52,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xFF1C8ECE),
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:random_app/ui/screens/data_verification/data_verification_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _houseController = TextEditingController();
  final TextEditingController _apartmentController = TextEditingController();

  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _streetFocusNode = FocusNode();
  final FocusNode _houseFocusNode = FocusNode();
  final FocusNode _apartmentFocusNode = FocusNode();

  List<String> cities = ['Токмок', 'Токтогул', 'Талас', 'Тараз', 'Термез'];
  List<String> streets = ['Ленина', 'Лермонтова', 'Ленинградская', 'Лесная', 'Луговая'];

  List<String> filteredCities = [];
  List<String> filteredStreets = [];

  bool showCityDropdown = false;
  bool showStreetDropdown = false;
  bool _agreedToTerms = false;

  @override
  void initState() {
    super.initState();
    filteredCities = cities;
    filteredStreets = streets;

    _cityFocusNode.addListener(_onCityFocusChange);
    _streetFocusNode.addListener(_onStreetFocusChange);
    _houseFocusNode.addListener(_onHouseFocusChange);
    _apartmentFocusNode.addListener(_onApartmentFocusChange);

    _cityController.addListener(_updateButtonState);
    _streetController.addListener(_updateButtonState);
    _houseController.addListener(_updateButtonState);
    _apartmentController.addListener(_updateButtonState);
  }

  bool _isFormValid() {
    return _cityController.text.isNotEmpty &&
        _streetController.text.isNotEmpty &&
        _houseController.text.isNotEmpty &&
        _apartmentController.text.isNotEmpty &&
        _agreedToTerms;
  }

  void _updateButtonState() {
    setState(() {
    });
  }

  void _onCityFocusChange() {
    if (_cityFocusNode.hasFocus) {
      _streetFocusNode.unfocus();
      _houseFocusNode.unfocus();
      _apartmentFocusNode.unfocus();
      setState(() {
        showCityDropdown = true;
      });
    } else {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (!_cityFocusNode.hasFocus) {
          setState(() {
            showCityDropdown = false;
          });
        }
      });
    }
  }

  void _onStreetFocusChange() {
    if (_streetFocusNode.hasFocus) {
      _cityFocusNode.unfocus();
      _houseFocusNode.unfocus();
      _apartmentFocusNode.unfocus();
      setState(() {
        showStreetDropdown = true;
      });
    } else {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (!_streetFocusNode.hasFocus) {
          setState(() {
            showStreetDropdown = false;
          });
        }
      });
    }
  }

  void _onHouseFocusChange() {
    if (_houseFocusNode.hasFocus) {
      _cityFocusNode.unfocus();
      _streetFocusNode.unfocus();
      _apartmentFocusNode.unfocus();
      setState(() {
        showCityDropdown = false;
        showStreetDropdown = false;
      });
    }
  }

  void _onApartmentFocusChange() {
    if (_apartmentFocusNode.hasFocus) {
      _cityFocusNode.unfocus();
      _streetFocusNode.unfocus();
      _houseFocusNode.unfocus();
      setState(() {
        showCityDropdown = false;
        showStreetDropdown = false;
      });
    }
  }

  void _filterCities(String query) {
    setState(() {
      filteredCities = cities
          .where((city) => city.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      showCityDropdown = true;
      if (query.isEmpty) {
        showCityDropdown = false;
      }
    });
    _updateButtonState();
  }

  void _filterStreets(String query) {
    setState(() {
      filteredStreets = streets
          .where((street) => street.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      showStreetDropdown = true;
      if (query.isEmpty) {
        showStreetDropdown = false;
      }
    });
    _updateButtonState();
  }

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

                  Text(
                    'Выберете город',
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
                        controller: _cityController,
                        focusNode: _cityFocusNode,
                        onChanged: _filterCities,
                        onTap: () => _cityFocusNode.requestFocus(),
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Montserrat'),
                        decoration: InputDecoration(
                          hintText: 'Город',
                          hintStyle: const TextStyle(color: Colors.grey, fontSize: 18, fontFamily: 'Montserrat'),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              if (_cityFocusNode.hasFocus) {
                                _cityFocusNode.unfocus();
                              } else {
                                _cityFocusNode.requestFocus();
                              }
                            },
                            child: AnimatedRotation(
                              turns: showCityDropdown ? 0.5 : 0.0,
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
                      height: showCityDropdown && filteredCities.isNotEmpty
                          ? (filteredCities.length > 2 ? 2 : filteredCities.length) * 44.0
                          : 0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: filteredCities.length > 2 ? 2 : filteredCities.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              _cityController.text = filteredCities[index];
                              _cityFocusNode.unfocus();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                              child: Text(filteredCities[index], style: const TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Montserrat')),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    'Выберете улицу',
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
                        controller: _streetController,
                        focusNode: _streetFocusNode,
                        onChanged: _filterStreets,
                        onTap: () => _streetFocusNode.requestFocus(),
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Montserrat'),
                        decoration: InputDecoration(
                          hintText: 'Улица',
                          hintStyle: const TextStyle(color: Colors.grey, fontSize: 18, fontFamily: 'Montserrat'),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              if (_streetFocusNode.hasFocus) {
                                _streetFocusNode.unfocus();
                              } else {
                                _streetFocusNode.requestFocus();
                              }
                            },
                            child: AnimatedRotation(
                              turns: showStreetDropdown ? 0.5 : 0.0,
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
                      height: showStreetDropdown && filteredStreets.isNotEmpty
                          ? (filteredStreets.length > 2 ? 2 : filteredStreets.length) * 44.0
                          : 0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: filteredStreets.length > 2 ? 2 : filteredStreets.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              _streetController.text = filteredStreets[index];
                              _streetFocusNode.unfocus();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                              child: Text(filteredStreets[index], style: const TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Montserrat')),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    'Номер дома',
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
                        controller: _houseController,
                        focusNode: _houseFocusNode,
                        keyboardType: TextInputType.number,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Montserrat'),
                        decoration: const InputDecoration(
                          hintText: '',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        onChanged: (text) => _updateButtonState(),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    'Номер квартиры',
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
                        controller: _apartmentController,
                        focusNode: _apartmentFocusNode,
                        keyboardType: TextInputType.number,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Montserrat'),
                        decoration: const InputDecoration(
                          hintText: '',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        onChanged: (text) => _updateButtonState(),
                      ),
                    ),
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
                        value: _agreedToTerms,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _agreedToTerms = newValue!;
                          });
                          _updateButtonState();
                        },
                        activeColor: const Color(0xFF424242),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Я прочитал и согласен с пользовательским соглашением, политикой конфиденциальности и согласием на сбор и обработку персональных \nданных',
                        style: const TextStyle(
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

                Container(
                  width: double.infinity,
                  height: 64,
                  child: ElevatedButton(
                    onPressed: _isFormValid()
                        ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DataVerificationScreen(
                            city: _cityController.text,
                            street: _streetController.text,
                            house: _houseController.text,
                            apartment: _apartmentController.text,
                          ),
                        ),
                      );
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1C8ECE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      padding: EdgeInsets.zero,
                      elevation: 2,
                      disabledBackgroundColor: const Color(0xFFB0C4DE),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: Text(
                            'ДОБАВИТЬ',
                            style: const TextStyle(
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
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/arrow.png',
                                  width: 52,
                                  height: 52,
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

  @override
  void dispose() {
    _cityController.removeListener(_updateButtonState);
    _streetController.removeListener(_updateButtonState);
    _houseController.removeListener(_updateButtonState);
    _apartmentController.removeListener(_updateButtonState);

    _cityController.dispose();
    _streetController.dispose();
    _houseController.dispose();
    _apartmentController.dispose();

    _cityFocusNode.removeListener(_onCityFocusChange);
    _streetFocusNode.removeListener(_onStreetFocusChange);
    _houseFocusNode.removeListener(_onHouseFocusChange);
    _apartmentFocusNode.removeListener(_onApartmentFocusChange);

    _cityFocusNode.dispose();
    _streetFocusNode.dispose();
    _houseFocusNode.dispose();
    _apartmentFocusNode.dispose();
    super.dispose();
  }
}

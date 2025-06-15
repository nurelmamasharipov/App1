import 'package:flutter/material.dart';
import 'package:random_app/ui/screens/data_verification/data_verification_screen.dart';
import 'package:random_app/ui/screens/registration/widgets/auto_complete_text_field.dart';
import 'package:random_app/ui/screens/registration/widgets/custom_text_field.dart';

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
    setState(() {});
  }

  void _unfocusAllAndFocus(FocusNode targetFocusNode) {
    _cityFocusNode.unfocus();
    _streetFocusNode.unfocus();
    _houseFocusNode.unfocus();
    _apartmentFocusNode.unfocus();
    targetFocusNode.requestFocus();
  }

  void _onCityFocusChange() {
    if (_cityFocusNode.hasFocus) {
      _unfocusAllAndFocus(_cityFocusNode); // Ensure only city has focus
      setState(() {
        showCityDropdown = true;
        showStreetDropdown = false; // Close other dropdown
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
      _unfocusAllAndFocus(_streetFocusNode); // Ensure only street has focus
      setState(() {
        showStreetDropdown = true;
        showCityDropdown = false; // Close other dropdown
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
      _unfocusAllAndFocus(_houseFocusNode); // Ensure only house has focus
      setState(() {
        showCityDropdown = false;
        showStreetDropdown = false;
      });
    }
  }

  void _onApartmentFocusChange() {
    if (_apartmentFocusNode.hasFocus) {
      _unfocusAllAndFocus(_apartmentFocusNode); // Ensure only apartment has focus
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

                  AutoCompleteTextField(
                    controller: _cityController,
                    focusNode: _cityFocusNode,
                    labelText: 'Выберете город',
                    hintText: 'Город',
                    suggestions: filteredCities,
                    showDropdown: showCityDropdown,
                    onChanged: _filterCities,
                    onSuggestionSelected: (String selectedCity) {
                      _cityController.text = selectedCity;
                      _cityFocusNode.unfocus();
                    },
                    onTapSuffixIcon: () {
                      if (_cityFocusNode.hasFocus) {
                        _cityFocusNode.unfocus();
                      } else {
                        _cityFocusNode.requestFocus();
                      }
                    },
                  ),

                  const SizedBox(height: 30),

                  AutoCompleteTextField(
                    controller: _streetController,
                    focusNode: _streetFocusNode,
                    labelText: 'Выберете улицу',
                    hintText: 'Улица',
                    suggestions: filteredStreets,
                    showDropdown: showStreetDropdown,
                    onChanged: _filterStreets,
                    onSuggestionSelected: (String selectedStreet) {
                      _streetController.text = selectedStreet;
                      _streetFocusNode.unfocus();
                    },
                    onTapSuffixIcon: () {
                      if (_streetFocusNode.hasFocus) {
                        _streetFocusNode.unfocus();
                      } else {
                        _streetFocusNode.requestFocus();
                      }
                    },
                  ),

                  const SizedBox(height: 30),

                  CustomTextField(
                    controller: _houseController,
                    focusNode: _houseFocusNode,
                    labelText: 'Номер дома',
                    keyboardType: TextInputType.number,
                    onChanged: (text) => _updateButtonState(),
                    onTap: () => _houseFocusNode.requestFocus(),
                  ),

                  const SizedBox(height: 30),

                  CustomTextField(
                    controller: _apartmentController,
                    focusNode: _apartmentFocusNode,
                    labelText: 'Номер квартиры',
                    keyboardType: TextInputType.number,
                    onChanged: (text) => _updateButtonState(),
                    onTap: () => _apartmentFocusNode.requestFocus(),
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
                        const Center(
                          child: Text(
                            'ДОБАВИТЬ',
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
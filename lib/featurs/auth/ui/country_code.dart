import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';

class CountryCode extends StatefulWidget {
  const CountryCode({super.key});

  @override
  State<CountryCode> createState() => _CountryCodeState();
}

class _CountryCodeState extends State<CountryCode> {
  @override
  Widget build(BuildContext context) {
    return  CountryCodePicker(
      mode: CountryCodePickerMode.bottomSheet,
      favorite: ['+20'],
      flagDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),

      onChanged: (country) {
        print('Country code selected: ${country.code}');
      },
      initialSelection: 'EG',
      showFlag: true,
      showDropDownButton: true,
    );
  }
}

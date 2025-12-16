import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 25,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = 'Hombre';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: selectedGender == 'Hombre'
                    ? AppColors.backgroundComponentSelected
                    : AppColors.backgroundComponent,
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/male.png',
                      height: 150,
                      width: 170,
                    ),
                    Text('Hombre'.toUpperCase(), style: TextStyles.primaryText),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = 'Mujer';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: selectedGender == 'Mujer'
                    ? AppColors.backgroundComponentSelected
                    : AppColors.backgroundComponent,
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/female.png',
                      height: 150,
                      width: 170,
                    ),
                    Text('Mujer'.toUpperCase(), style: TextStyles.primaryText),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

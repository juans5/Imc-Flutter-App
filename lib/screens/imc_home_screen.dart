import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/weight_age_selector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 20;
  int selectedWeight = 60;
  int selectedHeight = 150;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(
          valueSelected: selectedHeight,
          newHeightSlider: (newHeight) {
            setState(() {
              selectedHeight = newHeight;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Row(
            spacing: 22,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: WeightAgeSelector(
                  title: 'EDAD',
                  valueSelected: selectedAge,
                  newValueSlider: (newValue) {
                    setState(() => selectedAge = newValue);
                  },
                ),
              ),
              Expanded(
                child: WeightAgeSelector(
                  title: 'PESO (Kg)',
                  valueSelected: selectedWeight,
                  newValueSlider: (newValue) {
                    setState(() => selectedWeight = newValue);
                  },
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImcResultScreen(
                      height: selectedHeight,
                      weight: selectedWeight,
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text('Consultar', style: TextStyles.boldText),
            ),
          ),
        ),

        SizedBox(height: 10),
      ],
    );
  }
}

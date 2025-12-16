import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class WeightAgeSelector extends StatefulWidget {
  final String title;
  final int valueSelected;
  // final Function(int) newValueSlider;
  final ValueChanged<int> newValueSlider;

  const WeightAgeSelector({
    super.key,
    required this.title,
    required this.valueSelected,
    required this.newValueSlider,
    // required this.numSlider,
  });

  @override
  State<WeightAgeSelector> createState() => _WeightAgeSelector();
}

class _WeightAgeSelector extends State<WeightAgeSelector> {
  // double selectorSlider = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.backgroundComponent,
      ),
      child: Column(
        children: [
          SizedBox(height: 12),
          Text(widget.title, style: TextStyles.primaryText),
          SizedBox(height: 8),
          Text(
            widget.valueSelected.toString(),
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          Slider(
            value: widget.valueSelected.toDouble(),
            onChanged: (newValue) {
              widget.newValueSlider(newValue.toInt());
            },
            min: widget.title == 'EDAD' ? 1 : 30,
            max: widget.title == 'EDAD' ? 80 : 150,
            divisions: widget.title == 'EDAD' ? 80 : 120,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

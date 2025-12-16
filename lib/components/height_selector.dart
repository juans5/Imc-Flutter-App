import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final int valueSelected;
  final ValueChanged<int> newHeightSlider;

  const HeightSelector({
    super.key,
    required this.valueSelected,
    required this.newHeightSlider,
  });

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  // double heightSelector = 150;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            SizedBox(height: 12),
            Text('ALTURA', style: TextStyles.primaryText),
            SizedBox(height: 10),
            Text(
              '${widget.valueSelected} cm',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: widget.valueSelected.toDouble(),
              onChanged: (newHeight) {
                widget.newHeightSlider(newHeight.toInt());
              },
              min: 130,
              max: 230,
              label: '${widget.valueSelected} cm',
              divisions: 100,
              activeColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}

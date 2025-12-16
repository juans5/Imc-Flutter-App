import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';

class ImcResultScreen extends StatelessWidget {
  final int weight;
  final int height;

  const ImcResultScreen({
    super.key,
    required this.weight,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    double fixedHeight = height / 100;
    double imc = weight / (fixedHeight * fixedHeight);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Tus Resultados',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 12,
                right: 12,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Spacer(),
                      typeIMC(imc),
                      Text(
                        imc.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      stateIMC(imc),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(AppColors.primary),
                ),
                child: Text('FINALIZAR'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text('Resultados'),
      backgroundColor: AppColors.primary,
    );
  }

  Text stateIMC(double imc) {
    return Text(switch (imc) {
      < 18.5 => 'Estas debajo del peso saludable.',
      < 24.9 => 'Estas en el rango correcto y saludable.',
      < 29.9 => 'Te encuentras en un sobrepeso leve.',
      _ =>
        'Estas en Obesidad, mira más a detalle para ver el nivel de gravedad y asesorate por tu bienestar.',
    }, style: TextStyle(fontWeight: FontWeight.w500));
  }

  Text typeIMC(double imc) {
    final resultado = switch (imc) {
      < 18.5 => ('IMC Bajo', Colors.blue),
      < 24.9 => ('IMC Saludable', Colors.green),
      < 29.9 => ('IMC Elevado', Colors.red),
      _ => ('IMC Extremo', Colors.redAccent),
    };

    return Text(
      resultado.$1,
      style: TextStyle(
        color: resultado.$2,
        fontSize: 46,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

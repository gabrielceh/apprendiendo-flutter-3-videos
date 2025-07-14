import 'package:flutter/material.dart';

class GradientVideo extends StatelessWidget {
    final List<Color> colors; 
    final List<double> stops; 

  const GradientVideo({
    super.key, 
    this.colors = const [ Colors.transparent, Colors.black87],
    this.stops = const [0.8, 1.0],
  }): assert(colors.length == stops.length, 'Colors and stops must have the same length');

  @override
  Widget build(BuildContext context) {


    // tomara todo el espacio
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: stops, // depeneden de la cantidad de colores, primer elemento para el primer color, etc
            colors: colors,
          ),
        ),
      )
    );
  }
}
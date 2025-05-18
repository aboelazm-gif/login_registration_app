import 'package:animated_background/particles.dart';
import 'package:flutter/material.dart';

Color appBarBG = const Color.fromARGB(200, 255, 177, 125);
Color appBarTitle = const Color.fromARGB(255, 255, 244, 195);
MaterialAccentColor bubbleColor = Colors.deepOrangeAccent;
MaterialColor commonTextColor = Colors.blueGrey;
Color appBGColor = Colors.white;
Color buttonBGColor = const Color.fromARGB(255, 255, 150, 110);
Color buttonTextColor = const Color.fromARGB(255, 255, 220, 125);
Color pageTitleColor = Colors.orange;
Color textFieldOutline = const Color.fromARGB(255, 255, 220, 200);
RandomParticleBehaviour particleBehaviour = RandomParticleBehaviour(
  options: ParticleOptions(
    spawnMaxRadius: 100,
    spawnMinRadius: 25,
    spawnMaxSpeed: 100,
    spawnMinSpeed: 50,
    spawnOpacity: 0.0,
    particleCount: 7,
    opacityChangeRate: 0.1,
    baseColor: bubbleColor,
  ),
);

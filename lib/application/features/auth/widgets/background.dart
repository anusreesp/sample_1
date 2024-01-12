import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sample_1/application/features/auth/widgets/animatedwave.dart';
import 'package:simple_animations/animation_builder/mirror_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

const teal1 = Color.fromARGB(255, 165, 250, 241);
const pink1 = Color.fromARGB(255, 255, 171, 199);

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
              'color1',
              ColorTween(
                  begin: const Color.fromARGB(255, 15, 255, 231),
                  end: const Color.fromARGB(255, 164, 252, 243)),
              duration: const Duration(seconds: 3))
          .thenTween(
              'color2',
              ColorTween(
                  begin: const Color.fromARGB(255, 252, 120, 164),
                  end: const Color.fromARGB(255, 245, 195, 211)),
              duration: const Duration(seconds: 3));
    // return Container(
    //   decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //           begin: Alignment.topCenter,
    //           end: Alignment.bottomCenter,
    //           colors: [teal1, pink1])),
    // );

    return Stack(
      children: [
        Positioned.fill(
          child: MirrorAnimationBuilder(
              builder: (context, movie, _) {
                return Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [movie.get('color1'), movie.get('color2')])),
                );
              },
              tween: tween,
              duration: tween.duration),
        ),
        onBottom(const AnimatedWave(
          height: 180,
          speed: 1.0,
        )),
        onBottom(const AnimatedWave(
          height: 120,
          speed: 0.9,
          offset: pi,
        )),
        onBottom(const AnimatedWave(
          height: 220,
          speed: 1.2,
          offset: pi / 2,
        )),
      ],
    );
  }

  Widget onBottom(Widget child) {
    return Positioned.fill(
        child: Align(
      alignment: Alignment.bottomCenter,
      child: child,
    ));
  }
}

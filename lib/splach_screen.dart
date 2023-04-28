import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:movies/constance/theme.dart';
import 'package:movies/shared/animation_lottie_network_widget.dart';
import 'package:movies/views/home_layout_screen.dart';
import 'package:page_transition/src/enum.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: MediaQuery.of(context).size.height,
        backgroundColor: MyColor.mainColor,
        pageTransitionType: PageTransitionType.bottomToTop,
        splashTransition: SplashTransition.sizeTransition,
        splash: Center(
          child: AnimationLottieNetworkWidget(
            height: 300,
          ),
        ),
        nextScreen: const HomeLayoutScreen(),
        duration: 5000,
        animationDuration: const Duration(seconds: 3));
  }
}

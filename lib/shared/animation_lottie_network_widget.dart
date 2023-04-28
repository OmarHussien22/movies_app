import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/constance/theme.dart';

class AnimationLottieNetworkWidget extends StatelessWidget {
  const AnimationLottieNetworkWidget({this.height, super.key});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Lottie.network(
        'https://assets8.lottiefiles.com/packages/lf20_cbrbre30.json',
        animate: true,
        height: height ?? 180,
        alignment: Alignment.center,
        errorBuilder: (context, error, stackTrace) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wifi_off, size: 45, color: MyColor.white),
                Text(
                  'Check Wifi Connection',
                  style: TextStyle(fontSize: 30, color: MyColor.white),
                )
              ],
            ));
  }
}

import 'package:flutter/material.dart';
import 'package:movies/constance/theme.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';

class BuildNoNetwork extends StatelessWidget {
  const BuildNoNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColor.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 25,
          ),
          AutoSizeText(
            'check your connection!!!',
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25.0),
          ),
          Image.asset(
            'assets/images/warning.png',
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

buildFallBackWidget(context) => Scaffold(
        body: Center(
            child: CircularProgressIndicator(
      color: MyColor.mainColor,
    )));

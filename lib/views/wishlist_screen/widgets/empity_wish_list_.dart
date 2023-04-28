import 'package:flutter/material.dart';

class EmpityWishListWidget extends StatelessWidget {
  const EmpityWishListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        width: width,
        height: height / 1.4,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("No WishList Movies",
              style: Theme.of(context).textTheme.bodyLarge),
          Text(
            "Once you have added, come back:)",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ]),
      ),
    );
  }
}

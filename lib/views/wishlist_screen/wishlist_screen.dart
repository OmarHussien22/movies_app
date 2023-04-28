import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/logic/home_layout_cubit/home_layout_cubit.dart';
import 'package:movies/views/wishlist_screen/widgets/empity_wish_list_.dart';
import 'package:movies/views/wishlist_screen/widgets/item_wish_list_widget.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = HomeLayoutCubit.get(context);

    if (cubit.wishList.isEmpty) {
      cubit.createDataBase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: AutoSizeText('Movies',
              style: GoogleFonts.lobster(
                  textStyle: const TextStyle(fontSize: 35)))),
      body: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
        builder: (context, state) {
          var wishList = HomeLayoutCubit.get(context).wishList;
          return Conditional.single(
              context: context,
              conditionBuilder: (context) => wishList.isNotEmpty,
              widgetBuilder: (context) => const ItemsWishListWidget(),
              fallbackBuilder: (context) => const EmpityWishListWidget());
        },
      ),
    );
  }
}

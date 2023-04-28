import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/constance/navigation.dart';
import 'package:movies/logic/home_layout_cubit/home_layout_cubit.dart';
import 'package:movies/views/wishlist_screen/wishlist_screen.dart';

PreferredSizeWidget appBarWidget(
  context, {
  List<Widget>? actions,
  final Widget? leading,
  final Color? backgroundColor,
  final String? title,
  final bool? needLeading,
  final bool? needAction,
}) {
  return AppBar(
      toolbarHeight: 60,
      title: Text(title ?? 'Movies',
          style: GoogleFonts.lobster(textStyle: const TextStyle(fontSize: 35))),
      automaticallyImplyLeading: true,
      centerTitle: true,
      elevation: 0,
      leading: needLeading == true
          ? leading ??
              IconButton(
                  onPressed: () {
                    HomeLayoutCubit.get(context).changeThemeMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined))
          : const Text(''),
      actions: needAction == true
          ? actions ??
              [
                TextButton(
                    onPressed: () {
                      Move.nativeNavigatePush(context, const WishlistScreen());
                    },
                    child: Text(
                      'wishList',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white, fontSize: 18),
                    )),
              ]
          : []);
}

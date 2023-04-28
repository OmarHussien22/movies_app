import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:movies/constance/theme.dart';
import 'package:movies/logic/home_layout_cubit/home_layout_cubit.dart';
import 'package:movies/shared/app_bar_screen_widget.dart';
import 'package:movies/shared/no_network_widget.dart';
import 'package:movies/views/top_rated_screen/widget/item_card_top_rated_screen.dart';

class TopRatedScreen extends StatefulWidget {
  const TopRatedScreen({super.key});

  @override
  State<TopRatedScreen> createState() => _TopRatedScreenState();
}

class _TopRatedScreenState extends State<TopRatedScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = HomeLayoutCubit.get(context);
    if (cubit.topRatedModel == null) {
      cubit.getTopRatedData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLayoutCubit.get(context);
    return Scaffold(
        appBar: appBarWidget(context, needAction: true, needLeading: true),
        body: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
          buildWhen: (previous, current) =>
              current is ChangeFavIconTopRatedSuccess ||
              current is GetTopRatedDataLoading ||
              current is GetTopRatedDataSuccess ||
              current is GetTopRatedDataError,
          builder: (context, state) {
            if (state is GetTopRatedDataError) {
              return BuildNoNetwork();
            }
            return OfflineBuilder(
                connectivityBuilder: (
                  BuildContext context,
                  ConnectivityResult connectivity,
                  Widget child,
                ) {
                  final bool connected =
                      connectivity != ConnectivityResult.none;
                  if (connected) {
                    return Conditional.single(
                      context: context,
                      conditionBuilder: (context) =>
                          cubit.topRatedModel != null,
                      widgetBuilder: (context) {
                        if (cubit.topRatedModel!.result.isNotEmpty) {
                          return CardTopRetadWidget(cubit);
                        } else {
                          return const Icon(Icons.hourglass_empty);
                        }
                      },
                      fallbackBuilder: (context) => Center(
                          child: LoadingBouncingGrid.circle(
                        backgroundColor: MyColor.mainColor,
                      )),
                    );
                  } else {
                    return const BuildNoNetwork();
                  }
                },
                child: Center(
                    child: LoadingBouncingGrid.circle(
                  backgroundColor: MyColor.mainColor,
                )));
          },
        ));
  }
}

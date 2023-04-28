import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:movies/constance/theme.dart';
import 'package:movies/logic/home_layout_cubit/home_layout_cubit.dart';
import 'package:movies/shared/app_bar_screen_widget.dart';
import 'package:movies/shared/no_network_widget.dart';
import 'package:movies/views/popular_screen/widgets/item_card_popular_widget.dart';
import 'package:flutter_offline/flutter_offline.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = HomeLayoutCubit.get(context);
    if (cubit.popularModel == null) {
      cubit.getPopularData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLayoutCubit.get(context);
    return Scaffold(
        appBar: appBarWidget(context, needAction: true, needLeading: true),
        body: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
          buildWhen: (previous, current) =>
              current is ChangeFavIconPopularSuccess ||
              current is GetPopularDataLoading ||
              current is GetPopularDataSuccess ||
              current is GetPopularDataError,
          builder: (context, state) {
            if (state is GetPopularDataError) {
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
                      conditionBuilder: (context) => cubit.popularModel != null,
                      widgetBuilder: (context) {
                        if (cubit.popularModel!.result.isNotEmpty) {
                          return CardPopularWidget(cubit);
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:movies/constance/theme.dart';
import 'package:movies/logic/home_layout_cubit/home_layout_cubit.dart';
import 'package:movies/shared/app_bar_screen_widget.dart';
import 'package:movies/shared/no_network_widget.dart';
import 'package:movies/views/up_coming_screen/widget/item_card_up_coming_widget.dart';

class UpComingScreen extends StatefulWidget {
  const UpComingScreen({super.key});

  @override
  State<UpComingScreen> createState() => _UpComingScreenState();
}

class _UpComingScreenState extends State<UpComingScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = HomeLayoutCubit.get(context);
    if (cubit.upComingModel == null) {
      cubit.getUpComingData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLayoutCubit.get(context);
    return Scaffold(
        appBar: appBarWidget(context, needAction: true, needLeading: true),
        body: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
          buildWhen: (previous, current) =>
              current is ChangeFavIconUpComingSuccess ||
              current is GetUpComingDataLoading ||
              current is GetUpComingDataSuccess ||
              current is GetUpComingDataError,
          builder: (context, state) {
            if (state is GetUpComingDataError) {
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
                          cubit.upComingModel != null,
                      widgetBuilder: (context) {
                        if (cubit.upComingModel!.result.isNotEmpty) {
                          return CardUpComingWidget(cubit);
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

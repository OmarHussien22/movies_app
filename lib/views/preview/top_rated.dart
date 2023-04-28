import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:movies/constance/string.dart';
import 'package:movies/constance/theme.dart';
import 'package:movies/logic/home_layout_cubit/home_layout_cubit.dart';
import 'package:movies/shared/yt_player.dart';

class TopRatedPreviewScreen extends StatefulWidget {
  final int index;
  final HomeLayoutCubit cubit;

  const TopRatedPreviewScreen(this.index, this.cubit, {super.key});

  @override
  State<TopRatedPreviewScreen> createState() => _TopRatedPreviewScreenState();
}

class _TopRatedPreviewScreenState extends State<TopRatedPreviewScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = HomeLayoutCubit.get(context);
    if (cubit.videosModel == null) {
      cubit.getPopularVideos(
          videosId: widget.cubit.topRatedModel!.result[widget.index].id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLayoutCubit.get(context);
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      buildWhen: (previous, current) =>
          current is ChangeReadMore ||
          current is GetPopularVideosLoadingState ||
          current is GetPopularVideosSuccessState ||
          current is GetPopularVideosErrorState,
      builder: (context, state) {
        return Conditional.single(
          context: context,
          conditionBuilder: (context) => cubit.topRatedModel!.result.isNotEmpty,
          widgetBuilder: (context) => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: AutoSizeText(
                cubit.topRatedModel!.result[widget.index].title,
                minFontSize: 17,
                maxFontSize: 25,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Card(
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColor.white)),
                        margin: EdgeInsets.zero,
                        elevation: 5.0,
                        child: SizedBox(
                          width: double.infinity,
                          height: 280.0,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 5.0,
                                      child: FadeInImage.assetNetwork(
                                          height: 250.0,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          placeholder:
                                              'assets/images/loading.gif',
                                          image:
                                              '$imageUrl${cubit.topRatedModel!.result[widget.index].inSideImage}'),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      AutoSizeText(
                                        cubit.topRatedModel!
                                            .result[widget.index].title,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      AutoSizeText(
                                        cubit.topRatedModel!
                                            .result[widget.index].releaseDate,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star_rate_rounded,
                                            color: MyColor.mainColor,
                                          ),
                                          AutoSizeText(
                                            '${cubit.topRatedModel!.result[widget.index].voteAverage}',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: AutoSizeText(
                        'Overview',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 25.0,
                            color: MyColor.mainColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Card(
                      elevation: 5.0,
                      shape: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColor.white)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: AutoSizeText(
                              cubit
                                  .topRatedModel!.result[widget.index].overView,
                              minFontSize: 17,
                              maxFontSize: 22,
                              style: cubit.isReadMore
                                  ? Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontWeight: FontWeight.w500)
                                  : Theme.of(context).textTheme.titleLarge,
                              maxLines: cubit.isReadMore ? 3 : 15,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 8.0, right: 8.0),
                            child: Container(
                              height: 2,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: InkWell(
                              onTap: () {
                                cubit.readMore();
                              },
                              child: AutoSizeText(
                                cubit.isReadMore ? 'Read more' : 'Read less',
                                style: TextStyle(
                                    color: MyColor.mainColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: AutoSizeText(
                        'Trailers',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 25.0,
                            color: MyColor.mainColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Conditional.single(
                      context: context,
                      conditionBuilder: (context) =>
                          state is! GetPopularVideosLoadingState &&
                          cubit.videosModel!.result.isNotEmpty,
                      widgetBuilder: (context) => SizedBox(
                        height: 200,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => YouTubePlayer(
                                cubit.videosModel!.result[index].key),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 5,
                                ),
                            itemCount: cubit.videosModel!.result.length),
                      ),
                      fallbackBuilder: (context) => Center(
                          child: CircularProgressIndicator(
                        color: MyColor.mainColor,
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          fallbackBuilder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('loading'),
            ),
            body: Center(
                child: CircularProgressIndicator(
              color: MyColor.mainColor,
            )),
          ),
        );
      },
    );
  }
}

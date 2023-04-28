import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movies/constance/navigation.dart';
import 'package:movies/constance/string.dart';
import 'package:movies/logic/home_layout_cubit/home_layout_cubit.dart';
import 'package:movies/views/preview/preview_popular_screen.dart';

class CardPopularWidget extends StatelessWidget {
  const CardPopularWidget(this.cubit, {super.key});
  final HomeLayoutCubit cubit;
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemCount: cubit.popularModel!.result.length,
      crossAxisSpacing: 2,
      mainAxisSpacing: 8,
      itemBuilder: (context, index) => InkWell(
        onTap: () => Move.nativeNavigatePush(
            context, PopularPreviewScreen(index, cubit)),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    image:
                        '$imageKey${cubit.popularModel!.result[index].posterImage}'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    cubit.popularModel!.result[index].title.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: AutoSizeText(
                    cubit.popularModel!.result[index].releaseDate.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20, color: Colors.blueAccent),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        cubit.popularModel!.result[index].voteAverage
                            .toString(),
                        style: Theme.of(context).textTheme.bodyLarge!,
                      ),
                      const Icon(Icons.star_rate_rounded),
                      const Spacer(),
                      cubit.changeFaVIconPopular
                          ? IconButton(
                              onPressed: () {
                                cubit.changePopularIcon();
                                cubit.insertInWishListTable(
                                  index: index.toString(),
                                  title:
                                      cubit.popularModel!.result[index].title,
                                  releaseDate: cubit
                                      .popularModel!.result[index].releaseDate,
                                  voteRate: cubit
                                      .popularModel!.result[index].voteAverage,
                                  overView: cubit
                                      .popularModel!.result[index].overView,
                                );
                              },
                              icon: Icon(
                                Icons.favorite_border_sharp,
                                size: 30,
                                color: HexColor('#ac1457'),
                              ))
                          : IconButton(
                              onPressed: () {
                                cubit.changePopularIcon();
                                cubit.deleteFromWishListTable(
                                  title:
                                      cubit.popularModel!.result[index].title,
                                );
                              },
                              icon: Icon(
                                Icons.favorite,
                                size: 30,
                                color: HexColor('#ac1457'),
                              ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

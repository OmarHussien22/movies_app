import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:movies/constance/theme.dart';
import 'package:movies/logic/home_layout_cubit/home_layout_cubit.dart';

class ItemsWishListWidget extends StatelessWidget {
  const ItemsWishListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLayoutCubit.get(context);
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5.0,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: MyColor.mainColor,
                  child: Text(
                    '${cubit.wishList[index].id}',
                    style: TextStyle(
                        color: MyColor.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        '${cubit.wishList[index].name}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                            '${cubit.wishList[index].releaseDate}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Spacer(),
                          AutoSizeText(
                            '${cubit.wishList[index].voteRate}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            color: MyColor.mainColor,
                          )
                        ],
                      ),
                      const Divider(),
                      AutoSizeText('${cubit.wishList[index].overView}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 5.0,
      ),
      itemCount: cubit.wishList.length,
    );
  }
}

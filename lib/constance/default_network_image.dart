import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/constance/loading.dart';
import 'package:movies/constance/theme.dart';

class DefaultNetworkImage extends StatelessWidget {
  const DefaultNetworkImage(
    this.image, {
    Key? key,
    this.height,
    this.width,
    this.fit,
    this.placeholder,
    this.fromSliverList,
    this.loadingSize,
    this.needCache = true,
  }) : super(key: key);

  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Widget Function(BuildContext, String)? placeholder;
  final bool? fromSliverList;
  final double? loadingSize;
  final bool? needCache;
  @override
  Widget build(BuildContext context) {
    return needCache!
        ? CachedNetworkImage(
            imageUrl: image,
            placeholder: placeholder ??
                (context, url) =>
                    fromSliverList != null && fromSliverList == true
                        ? LoadingSliverGridCircleWidget(
                            borderColor: MyColor.white,
                            borderSize: 2,
                            size: loadingSize,
                          )
                        : LoadingGridCircleWidget(
                            borderColor: MyColor.white,
                            borderSize: 2,
                            size: loadingSize,
                          ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: height ?? MediaQuery.of(context).size.height,
            width: width ?? MediaQuery.of(context).size.width,
            fit: fit ?? BoxFit.cover,
            fadeInCurve: Curves.ease,
          )
        : Image.network(
            image,
            loadingBuilder: (context, url, _) =>
                fromSliverList != null && fromSliverList == true
                    ? LoadingSliverGridCircleWidget(
                        borderColor: MyColor.white,
                        borderSize: 2,
                        size: loadingSize,
                      )
                    : LoadingGridCircleWidget(
                        borderColor: MyColor.white,
                        borderSize: 2,
                        size: loadingSize,
                      ),
            errorBuilder: (context, url, error) => const Icon(Icons.error),
            height: height ?? MediaQuery.of(context).size.height,
            width: width ?? MediaQuery.of(context).size.width,
            fit: fit ?? BoxFit.cover,
          );
  }
}

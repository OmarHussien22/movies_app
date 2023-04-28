import 'package:flutter/material.dart';
import 'package:movies/constance/reuse_widgets.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YouTubePlayer extends StatelessWidget {
  const YouTubePlayer(this.videoID, {super.key});
  final dynamic videoID;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _showDialog(
            context,
            videoID,
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width - 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  YoutubePlayerController.getThumbnail(
                      videoId: '$videoID',
                      quality: ThumbnailQuality.standard,
                      webp: false),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Icon(
              Icons.play_circle_filled,
              color: Colors.white,
              size: 55.0,
            ),
          ],
        ),
      ),
    );
  }
}

void _showDialog(context, videoID) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return YoutubeViewer(
        '$videoID',
      );
    },
  );
}

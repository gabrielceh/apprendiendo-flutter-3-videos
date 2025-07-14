import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post_entity.dart';
import 'package:tok_tik/presentation/widgets/shared/video_buttons.dart';
import 'package:tok_tik/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPostEntity> videos;

  const VideoScrollableView({
      super.key, 
      required this.videos
    });

  @override
  Widget build(BuildContext context) {
    // usamos builder porque no renderizat todos los widgets de video de golpe
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index){
        final VideoPostEntity videoPost = videos[index];

        return Stack(
          children: [
            // Video player + gradiente
            SizedBox.expand( // usamos para que abarque todo el contenido
              child: FullScreenPlayer(videoUrl: videoPost.videoUrl, caption: videoPost.caption),
            ),

            // Botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost)
            ),
          ],
        );
      },
     
    );
  }
}
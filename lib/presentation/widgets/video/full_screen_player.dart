// añadimos la dependencia video_player: flutter pub add video_player
// documentación: https://pub.dev/packages/video_player
// importante los permisos para android y ios

import 'package:flutter/material.dart';
import 'package:tok_tik/presentation/widgets/video/gradient_video.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {

  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key,
    required this.videoUrl,
    this.caption = 'No video name',
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

  late VideoPlayerController controller;
  late Future<void> initializeVideoPlayerFuture;

  // cliclo de vida, cuando se inicia el widget
  @override
  void initState() {
    super.initState(); // siempre al inicio
    // le indicamos al controller que vamos a usar un video pero viene de los assets
    controller = VideoPlayerController.asset(widget.videoUrl,)
    ..setVolume(0)
    ..setLooping(true)
    ..play();
    initializeVideoPlayerFuture = controller.initialize();
  }

  // cliclo de vida, cuando se destruye el widget
  @override
  void dispose() {
    //destruimos el widget asi evitamos que el video siga reproduciendo cuando ya no esta, o evitar fugas de memoria
    controller.dispose();
    super.dispose(); // siempre al final
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeVideoPlayerFuture, 
      builder: (context, snapshot) {
        // snapshot es el estado del future, si esta ok, muestra el video, si no, muestra algo mas
        if(snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator(strokeWidth: 2,));
        }

        return GestureDetector(
          onTap: (){
            if(controller.value.isPlaying) {
              controller.pause();
              return;
            } 
            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(children: [
              VideoPlayer(controller),
          
              // Gradiente
              GradientVideo(),
          
              // Texto
              Positioned(
                bottom: 50,
                left: 20,
                child: _VideoCaption(caption: widget.caption,),
              ),

             
            ]),
          ),
        );

      }
    );
  }
}

class _VideoCaption extends StatelessWidget {

  final String caption;

  const _VideoCaption({
    super.key,
    required this.caption
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style: titleStyle,),
    );
  }
}
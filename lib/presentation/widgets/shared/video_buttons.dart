import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tok_tik/config/helpers/human_formats.dart';
import 'package:tok_tik/domain/entities/video_post_entity.dart';

class VideoButtons extends StatelessWidget {

  final VideoPostEntity video;

  const VideoButtons({
      super.key,
      required this.video
    });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _CustomIconButton(value: (video.likes), iconData: Icons.favorite, iconColor: Colors.red),
      const SizedBox(height: 20,),
      _CustomIconButton(value: video.views, iconData: Icons.remove_red_eye_outlined),
      const SizedBox(height: 20,),
      SpinPerfect(// paquete animate_do
        infinite: true,
        duration: const Duration(seconds: 5),
        child: _CustomIconButton(value: -1, iconData: Icons.play_circle_outlined)
        )

    ],);
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton({
    required this.value,
    required this.iconData,
    iconColor,
  }): color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: (){}, icon: Icon(iconData, color: color, size: 30,)),
        if(value >= 0 ) Text(HumanFormats.humanReadbleNumber(value.toDouble())),
      ],
    );
  }
}
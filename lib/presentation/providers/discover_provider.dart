import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post_entity.dart';
import 'package:tok_tik/infrastructure/models/local_video_model.dart';
import 'package:tok_tik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {

  // TODO: repository, DataSource

  bool initialLoading = true;
  List<VideoPostEntity> videoList = [];

  Future<void> loadNextPage() async {
    // simulamos el tiempo de carga
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPostEntity> newVideoList = videoPosts.map((el) => LocalVideoModel.fromJson(el).toVideoPostEntity()).toList();

    videoList.addAll(newVideoList);
    initialLoading = false;
    notifyListeners();
  }



}
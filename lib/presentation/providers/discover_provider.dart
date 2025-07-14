import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post_entity.dart';
import 'package:tok_tik/domain/repositories/video_post_repository.dart';



class DiscoverProvider extends ChangeNotifier {

  // TODO: repository, DataSource
  final VideoPostRepository videoPostRepository;

  bool initialLoading = true;
  List<VideoPostEntity> videoList = [];

  DiscoverProvider({
    required this.videoPostRepository
  });

  Future<void> loadNextPage() async {

    final newVideoList = await videoPostRepository.getTrendingVideosByPage(1);



    videoList.addAll(newVideoList);
    initialLoading = false;
    notifyListeners();
  }



}
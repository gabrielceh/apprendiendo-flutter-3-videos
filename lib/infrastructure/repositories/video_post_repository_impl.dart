import 'package:tok_tik/domain/datasources/video_post_datasource.dart';
import 'package:tok_tik/domain/entities/video_post_entity.dart';
import 'package:tok_tik/domain/repositories/video_post_repository.dart';


// Aqui nos envian el origgen del dato (data source) y los llamamos
class VideoPostsRepositoryImpl implements VideoPostRepository{

  final VideoPostDatasource videoPostDatasource;

  VideoPostsRepositoryImpl({
    required this.videoPostDatasource
  });

  @override
  Future<List<VideoPostEntity>> getFavoritesVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPostEntity>> getTrendingVideosByPage(int page) {
    return videoPostDatasource.getTrendingVideosByPage(page);
  }
}
import 'package:tok_tik/domain/entities/video_post_entity.dart';

abstract class VideoPostRepository {

  Future<List<VideoPostEntity>> getTrendingVideosByPage( int page);
  Future<List<VideoPostEntity>> getFavoritesVideosByUser( String userId);

}
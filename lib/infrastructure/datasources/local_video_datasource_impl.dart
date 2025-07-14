import 'package:tok_tik/domain/datasources/video_post_datasource.dart';
import 'package:tok_tik/domain/entities/video_post_entity.dart';
import 'package:tok_tik/infrastructure/models/local_video_model.dart';
import 'package:tok_tik/shared/data/local_video_posts.dart';

// este es el data source para los videos LOCALES, si queremos para videos que provienen de otras fuentes como peticones https, debemos implementar otro data source
class LocalVideoDatasource extends VideoPostDatasource {

  @override
  Future<List<VideoPostEntity>> getTrendingVideosByPage( int page) async {
    await Future.delayed(const Duration(seconds: 2));
    
    final List<VideoPostEntity> newVideoList = videoPosts.map((el) => LocalVideoModel.fromJson(el).toVideoPostEntity()).toList();

    return newVideoList;
  }

  // Esto es ejemplo
  @override
  Future<List<VideoPostEntity>> getFavoritesVideosByUser( String userId) {
    throw UnimplementedError();
  }
}
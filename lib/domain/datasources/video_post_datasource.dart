// Esta clase goobernará la implemetacion de los origines de datos
// No queremos que se creen instancias de esta clase
// las clases que implementen esta interfaz van a ser origenes de datos permitidos para que los providers puedan acceder a ellos

import 'package:tok_tik/domain/entities/video_post_entity.dart';

abstract class VideoPostDatasource {

  Future<List<VideoPostEntity>> getTrendingVideosByPage( int page);
  Future<List<VideoPostEntity>> getFavoritesVideosByUser( String userId);

}
import 'package:admin_portal/infrastructure/constants/url_constants.dart';
import 'package:admin_portal/infrastructure/core/dio_client.dart';
import 'package:admin_portal/infrastructure/post/post_repository.dart';
import 'package:admin_portal/infrastructure/post/post_service.dart';
import 'package:admin_portal/presentation/core/app_router.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;


Future<void> startup() async {
  sl.registerSingleton<AppRouter>(AppRouter());
  sl.registerSingleton<DioClient>(DioClient.init(UrlConstants.baseUrl));

  sl.registerSingleton<PostService>(PostService());
  sl.registerSingleton<PostRepository>(PostRepositoryImpl(sl()));
}
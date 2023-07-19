import 'package:admin_portal/presentation/core/app_router.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;


Future<void> startup() async {
  sl.registerSingleton<AppRouter>(AppRouter());
}
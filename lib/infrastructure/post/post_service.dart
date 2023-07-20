import 'package:admin_portal/infrastructure/core/dio_client.dart';
import 'package:admin_portal/infrastructure/core/dio_response.dart';
import 'package:admin_portal/infrastructure/core/type_def.dart';
import 'package:admin_portal/service_locator.dart';

class PostService {
  final dioClient = sl<DioClient>();

  Future<DioResponse> postList(Jmap? params) async {
    final response = await dioClient.get("posts", queryParameters: params);
    return response;
  }

  Future<DioResponse> commentListByPost(Jmap? params) async {
    final response = await dioClient.get("comments", queryParameters: params);
    return response;
  }
}

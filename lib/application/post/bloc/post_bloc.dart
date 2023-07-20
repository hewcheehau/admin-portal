import 'package:admin_portal/domain/post/post_model.dart';
import 'package:admin_portal/infrastructure/post/post_repository.dart';
import 'package:admin_portal/service_locator.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart' show RateLimit;

part 'post_event.dart';
part 'post_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<PostListFetched>(_onPostListFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  final PostRepository postRepository = sl<PostRepository>();

  _onPostListFetched(PostListFetched event, Emitter<PostState> emitter) async {
    emitter(state.copyWith(status: PostStatus.loading));
    try {
      final response = await postRepository.getPost(id: event.id);
      if (response is List<PostModel>) {
        emitter(state.copyWith(postList: response,status: PostStatus.success));
        return;
      }
      emitter(state.copyWith(status: PostStatus.success, postList: []));
    }
    catch (e) {
      debugPrint(e.toString());
      emitter(state.copyWith(status: PostStatus.fail));
    }
  }
}

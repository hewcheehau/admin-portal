import 'package:admin_portal/domain/post/post_comment_model.dart';
import 'package:admin_portal/infrastructure/post/post_repository.dart';
import 'package:admin_portal/service_locator.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart' show RateLimit;

part 'comment_event.dart';
part 'comment_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(const CommentState()) {
    on<CommentListFetched>(_onCommentListFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  final PostRepository postRepository = sl<PostRepository>();

  _onCommentListFetched(CommentListFetched event, Emitter<CommentState> emitter) async {
    emitter(state.copyWith(status: CommentStatus.loading));
    try {
      final response = await postRepository.getPostComment(id: event.id);
      if (response is List<PostCommentModel>) {
        emitter(state.copyWith(comments: response,status: CommentStatus.success));
        return;
      }
      emitter(state.copyWith(status: CommentStatus.success, comments: []));
    }
    catch (e) {
      debugPrint(e.toString());
      emitter(state.copyWith(status: CommentStatus.fail));
    }
  }
}

part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostListFetched extends PostEvent {
  final int id;
  PostListFetched({this.id = -1});

  @override
  List<Object?> get props => [id];
}
part of 'score_bloc.dart';

sealed class ScoreEvent {}

class Update extends ScoreEvent {
  final ScoreModel model;

  Update({required this.model});
}

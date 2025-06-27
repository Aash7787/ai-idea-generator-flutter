part of 'idea_bloc.dart';

@immutable
sealed class IdeaState {
  const IdeaState();
}

final class IdeaInitial extends IdeaState {
  const IdeaInitial();
}

final class IdeaLoading extends IdeaState {
  const IdeaLoading();
}

final class IdeaLoaded extends IdeaState {
  final List<String> ideas;
  const IdeaLoaded(this.ideas);
}

final class IdeaError extends IdeaState {
  final String error;
  const IdeaError(this.error);
}

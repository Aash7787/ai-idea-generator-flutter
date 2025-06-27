part of 'idea_bloc.dart';

@immutable
sealed class IdeaEvent {
  const IdeaEvent();
}

class GenerateIdeas extends IdeaEvent {
  final String topic;
  const GenerateIdeas(this.topic);
}


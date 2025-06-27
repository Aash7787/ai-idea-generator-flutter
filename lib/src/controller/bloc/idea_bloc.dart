import 'dart:async';

import 'package:ai_idea_generator_flutter/src/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'idea_event.dart';
part 'idea_state.dart';

class IdeaBloc extends Bloc<IdeaEvent, IdeaState> {
  final ApiService apiService = ApiService(baseUrl: 'http://192.168.1.15:3000');
  IdeaBloc() : super(IdeaInitial()) {
    on<GenerateIdeas>(_genIdea);
    on<ResetIdea>((event, emit) => emit(IdeaInitial()));
  }

  FutureOr<void> _genIdea(GenerateIdeas event, Emitter<IdeaState> emit) async {
    emit(IdeaLoading());
    try {
      final idea = await apiService.generateIdeas(event.topic);
      emit(IdeaLoaded(idea));
    } catch (e) {
      emit(IdeaError(e.toString()));
    }
  }
}

import 'package:ai_idea_generator_flutter/src/controller/bloc/idea_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  static const route = '/result/screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<IdeaBloc, IdeaState>(
          // bloc: IdeaBloc(),
          builder: (context, state) {
            return switch (state) {
              IdeaInitial() ||
              IdeaLoading() => const Center(child: CircularProgressIndicator()),
              IdeaLoaded(ideas: final ideas) => IdeaList(ideas: ideas),
              IdeaError(error: final error) => Center(
                child: SelectableText(
                  error,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            };
          },
        ),
      ),
    );
  }
}

class IdeaList extends StatelessWidget {
  const IdeaList({super.key, required this.ideas});

  final List<String> ideas;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: ideas.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, index) => ListTile(title: Text(ideas[index])),
    );
  }
}

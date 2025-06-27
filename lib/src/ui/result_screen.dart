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
            if (state is IdeaLoading) {
              // show spinner while fetching
              return const Center(child: CircularProgressIndicator());
            } else if (state is IdeaLoaded) {
              // show the list of ideas
              return ListView.separated(
                itemCount: state.ideas.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (_, index) {
                  return ListTile(title: Text(state.ideas[index]));
                },
              );
            } else if (state is IdeaError) {
              // show an error message
              return Center(
                child: SelectableText(
                  state.error,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            // initial state (before any fetch)
            return const Center(
              child: Text('Enter a topic and tap “Generate Ideas”'),
            );
          },
        ),
      ),
    );
  }
}

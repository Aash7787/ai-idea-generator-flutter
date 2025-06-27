import 'package:ai_idea_generator_flutter/src/controller/bloc/idea_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.topic});
  static const route = '/result/screen';
  final String topic;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<IdeaBloc>().add(GenerateIdeas(widget.topic));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<IdeaBloc, IdeaState>(
          builder: (context, state) {
            return switch (state) {
              IdeaInitial() ||
              IdeaLoading() => const Center(child: CircularProgressIndicator()),
              IdeaLoaded(ideas: final ideas) => _buildIdeaList(ideas),
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

  Widget _buildIdeaList(List<String> ideas) {
    return ListView.separated(
      itemCount: ideas.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, index) => ListTile(title: Text(ideas[index])),
    );
  }
}

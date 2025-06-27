import 'package:ai_idea_generator_flutter/src/controller/bloc/idea_bloc.dart';
import 'package:ai_idea_generator_flutter/src/routes/gen_route.dart';
import 'package:ai_idea_generator_flutter/src/ui/input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(create: (_) => IdeaBloc(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenRoute,
      initialRoute: InputScreen.route,
    );
  }
}

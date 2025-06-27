import 'package:ai_idea_generator_flutter/src/ui/input_screen.dart';
import 'package:ai_idea_generator_flutter/src/ui/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenRoute(RouteSettings settings) {
  return switch (settings.name) {
    InputScreen.route => CupertinoPageRoute(
      builder: (context) => const InputScreen(),
    ),
    ResultScreen.route => CupertinoPageRoute(
      builder: (context) {
        return ResultScreen();
      },
    ),
    _ => MaterialPageRoute(
      builder: (context) => ErrorWidget('Route not Found'),
    ),
  };
}

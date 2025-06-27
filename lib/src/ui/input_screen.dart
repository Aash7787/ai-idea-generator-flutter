import 'package:ai_idea_generator_flutter/src/ui/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  static const route = '/';

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  late final TextEditingController topicEditingController;

  @override
  void initState() {
    topicEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    topicEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        SystemNavigator.pop();
      },
      child: Scaffold(
        appBar: AppBar(title: Text('AI Idea Generator')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: topicEditingController,
                onSubmitted: (value) => _onSubmit,
                onEditingComplete: () => _onSubmit(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hint: Text('Enter your idea'),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _onSubmit(),
              child: Text('Generate Idea'),
            ),
            SizedBox(height: 150),
          ],
        ),
      ),
    );
  }

  void _onSubmit() {
    var topic = topicEditingController.text.trim();
    if (topic.isNotEmpty) {
      Navigator.pushNamed(context, ResultScreen.route, arguments: topic);
    }
  }
}

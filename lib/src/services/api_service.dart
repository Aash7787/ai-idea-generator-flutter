import 'dart:convert';

import 'package:ai_idea_generator_flutter/src/common/extension/api_status_code.dart';
import 'package:http/http.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<List<String>> generateIdeas(String topic) async {
    final response = await post(
      Uri.parse('$baseUrl/api/generate-ideas'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(({'topic': topic})),
    );
    if (!response.isOk) {
      throw Exception('Failed to generate ideas');
    }
    return List<String>.from(jsonDecode(response.body));
  }
}

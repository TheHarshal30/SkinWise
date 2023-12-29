// TODO: Replace YOUR_API_KEY with your API key.
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kpkwk/logic/localllm.dart';

class Llm2 {
  Future<String?> getPoems(String productName) async {
    var apiKey = '';
    const haikuCount = 1;

    final url = Uri.parse('');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      "prompt": {
        "context": "You are a dermatologist with many years of experience.",
        "examples": [],
        "messages": [
          {"content": "$productName"}
        ]
      },
      "candidate_count": haikuCount,
      "temperature": 0.7,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        String haikus = 'Here are cures for $productName:\n\n';
        for (var i = 0; i < haikuCount; i++) {
          haikus += '${i + 1}.\n';
          haikus += decodedResponse['candidates'][i]['content'] + '\n\n';
        }
        print(haikus);
        return haikus;
      } else {
        String? haikus = llmanswers[productName];
        return haikus;
      }
    } catch (error) {
      String? haikus = llmanswers[productName];
      return haikus;
    }
    return "";
  }
}

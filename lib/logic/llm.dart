// TODO: Replace YOUR_API_KEY with your API key.
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kpkwk/logic/localllm.dart';

class Llm {
  Future<String?> getPoems(String productName) async {
    var apiKey = '';
    const haikuCount = 1;

    final url = Uri.parse('');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      "prompt": {
        "context": "You are a dermatologist with many years of experience.",
        "examples": [
          {
            "input": {"content": "Give cures for warts molluscum."},
            "output": {
              "content": '''

* **Over-the-counter (OTC) treatments.** There are a number of OTC wart treatments available, such as salicylic acid, imiquimod, and cantharidin. These treatments can be effective in removing warts, but they may take several weeks or months to work. 
* **Prescription treatments.** If OTC treatments are not effective, your doctor may prescribe a prescription wart treatment, such as cryotherapy, laser therapy, or electrocautery. These treatments are more effective than OTC treatments, but they can also be more painful. 
* **Home remedies.** There are a number of home remedies that have been used to treat warts, such as apple cider vinegar, garlic, and duct tape. However, there is no scientific evidence to support the effectiveness of these remedies. 
* **Molluscum contagiosum.** Molluscum contagiosum is a viral infection that causes small, raised bumps on the skin. These bumps are usually painless, but they can be itchy or irritating. Molluscum contagiosum is usually treated with topical treatments, such as salicylic acid or cantharidin. In some cases, oral antiviral medications may be necessary. 

 '''
            }
          }
        ],
        "messages": [
          {
            "content":
                "Give a brief description and cures for ${productName} in markdown format"
          }
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

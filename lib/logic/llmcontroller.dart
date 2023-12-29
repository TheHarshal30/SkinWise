import 'package:kpkwk/logic/llm.dart';
import 'package:kpkwk/logic/llm2.dart';

class LlmController {
  final Llm poemRepository = Llm();
  final Llm2 poemRepository2 = Llm2();

  Future<String?> getPoem(String productName, int l) {
    print("hello");
    return (l == 1)
        ? poemRepository.getPoems(productName)
        : poemRepository2.getPoems(productName);
  }
}

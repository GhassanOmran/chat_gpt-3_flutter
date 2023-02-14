import 'package:untitled1/core/models/text_and_code/gpt_model.dart';

Map<String, List<GptModel>> listAllModels = {
  "text-models": [
    GptModel(
        name: "text-davinci-003",
        tokens: 500,
        maxToken: 4000,
        description:
            "Most capable GPT-3 model. Can do any task the other models can do, often with higher quality, longer output and better instruction-following. Also supports inserting completions within text."),
    GptModel(
        name: "text-curie-001",
        tokens: 500,
        maxToken: 2048,
        description: "Very capable, but faster and lower cost than Davinci."),
    GptModel(
        name: "text-babbage-001",
        tokens: 500,
        maxToken: 2048,
        description:
            "Capable of straightforward tasks, very fast, and lower cost."),
    GptModel(
        name: "text-ada-001",
        tokens: 500,
        maxToken: 2048,
        description:
            "Capable of very simple tasks, usually the fastest model in the GPT-3 series, and lowest cost."),
  ],
  "codex-models": [
    GptModel(
        name: "code-davinci-002",
        tokens: 500,
        maxToken: 8000,
        description:
            """Most capable Codex model. Particularly good at translating natural language to code.In addition to completing code, also supports inserting completions within code."""),
    GptModel(
        name: "code-cushman-001",
        tokens: 500,
        maxToken: 2048,
        description:
            "Almost as capable as Davinci Codex, but slightly faster. This speed advantage may make it preferable for real-time applications."),
  ]
};

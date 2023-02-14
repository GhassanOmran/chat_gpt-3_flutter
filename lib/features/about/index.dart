import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/constants/gpt_models.dart';
import 'package:untitled1/core/shared/widgets/tile/expansion_tile.dart';
import 'package:untitled1/features/about/controller.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About"),
          centerTitle: true,
        ),
        body: ListView(children: [
          ExpansionTile(
            title: const Text(
              "Codex Models",
              style: TextStyle(
                  fontSize: 20, height: 1.2, fontWeight: FontWeight.bold),
            ),
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: const Text(
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.2,
                      ),
                      '''The Codex model series is a descendant of our GPT-3 series that's been trained on both natural language and billions of lines of code. It's most capable in Python and proficient in
over a dozen languages including JavaScript, Go, Perl, PHP, Ruby, Swift, TypeScript, SQL, and even Shell.
During this initial limited beta period, Codex usage is free.''')),
              builditem("code-davinci-002",
                  listAllModels["codex-models"]![0].description!),
              builditem("code-cushman-001",
                  listAllModels["codex-models"]![1].description!),
            ],
          ),
          ExpansionTile(
            title: const Text(
              "Text Models",
              style: TextStyle(
                  fontSize: 20, height: 1.2, fontWeight: FontWeight.bold),
            ),
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: const Text(
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.2,
                      ),
                      "Our GPT-3 models can understand and generate natural language. We offer four main models with different levels of power suitable for different tasks. Davinci is the most capable model, and Ada is the fastest.")),
              builditem("text-davinci-003",
                  listAllModels["text-models"]![0].description!),
              builditem("text-curie-001",
                  listAllModels["text-models"]![1].description!),
              builditem("text-babbage-001",
                  listAllModels["text-models"]![2].description!),
              builditem("text-ada-001",
                  listAllModels["text-models"]![3].description!),
            ],
          ),
        ]));
  }
}

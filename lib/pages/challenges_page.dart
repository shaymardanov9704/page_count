import 'package:flutter/material.dart';
import 'package:page_counter/models/page_model.dart';

class ChallengesPage extends StatefulWidget {
  const ChallengesPage({super.key});

  @override
  State<ChallengesPage> createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Challenges",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (_, i) => Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: ExpansionTile(
            title: const Text("Challenge"),
            children: [
              PageModel(name: "Name1", pageNumber: 1),
              PageModel(name: "Name2", pageNumber: 2),
              PageModel(name: "Name3", pageNumber: 3)
            ]
                .map(
                  (e) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(width: 0.6),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.name),
                        Row(
                          children: [
                            Text(
                              "First half ${e.firstHalfGoal}/${e.firstHalfCount}",
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add_circle),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Second half ${e.secondHalfGoal}/${e.secondHalfCount}",
                            ),
                            IconButton(
                              onPressed: () async {
                                e.addSecondHalfCount(1);
                              },
                              icon: const Icon(Icons.add_circle),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

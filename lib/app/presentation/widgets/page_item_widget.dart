import 'package:flutter/material.dart';
import 'package:page_counter/app/data/models/page_model.dart';

class PageItemWidget extends StatelessWidget {
  final PageModel page;
  final Function() onChange;

  const PageItemWidget({super.key, required this.page, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.blueGrey,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                page.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${page.pageNumber}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          Row(
            children: [
              Text("${page.firstHalfGoal} ${page.firstHalfCount}"),
              IconButton(
                onPressed: () {
                  final i = page.firstHalfCount ?? 0 + 2;
                  page.addFirstHalfCount(i);
                  onChange();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          Row(
            children: [
              Text("${page.secondHalfGoal} ${page.secondHalfCount}"),
              IconButton(
                onPressed: () {
                  page.addSecondHalfCount(page.secondHalfCount ?? 0 + 1);
                  onChange();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

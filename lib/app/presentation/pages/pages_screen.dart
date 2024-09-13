import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_counter/app/data/models/page_model.dart';
import 'package:page_counter/app/data/repository/pages_box.dart';
import 'package:page_counter/app/presentation/widgets/page_item_widget.dart';

class PagesScreen extends StatefulWidget {
  const PagesScreen({super.key});

  @override
  State<PagesScreen> createState() => _PagesScreenState();
}

class _PagesScreenState extends State<PagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pages")),
      body: ValueListenableBuilder(
        valueListenable: PagesBox.getPages().listenable(),
        builder: (context, value, _) {
          final pages = PagesBox.getPages().values.toList().cast<PageModel>();
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: pages.length,
            itemBuilder: (_, i) => PageItemWidget(
              page: pages[i],
              onChange: () => setState(() {
                print("object");
              }),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final box = PagesBox.getPages();
          // box.clear();
          box.add(
            PageModel(
              name: "Name",
              pageNumber: 1,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

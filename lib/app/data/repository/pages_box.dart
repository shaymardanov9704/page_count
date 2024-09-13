import 'package:hive/hive.dart';
import 'package:page_counter/app/data/models/page_model.dart';

class PagesBox {
  static Box<PageModel> getPages() => Hive.box<PageModel>("pages");
}

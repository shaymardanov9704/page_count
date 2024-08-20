import 'package:hive/hive.dart';
import 'page_model.dart';

part 'challenge_model.g.dart';

@HiveType(typeId: 3)
enum ChallengeType {
  @HiveField(0)
  Reading,

  @HiveField(1)
  Fitness,

  @HiveField(2)
  Learning,
}

@HiveType(typeId: 4)
class ChallengeModel {
  @HiveField(0)
  ChallengeType type;

  @HiveField(1)
  DateTime beginDate;

  @HiveField(2)
  DateTime endDate;

  @HiveField(3)
  List<PageModel> pages;

  ChallengeModel({
    required this.type,
    required this.beginDate,
    required this.endDate,
    required this.pages,
  });
}

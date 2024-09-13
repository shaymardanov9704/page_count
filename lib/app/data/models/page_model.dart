import 'package:hive/hive.dart';

part 'page_model.g.dart';

@HiveType(typeId: 2)
class PageModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  int pageNumber;

  @HiveField(2)
  int? firstHalfCount;

  @HiveField(3)
  int? secondHalfCount;

  @HiveField(4)
  int? firstHalfGoal;

  @HiveField(5)
  int? secondHalfGoal;

  PageModel({
    required this.name,
    required this.pageNumber,
    this.firstHalfCount,
    this.secondHalfCount,
    this.firstHalfGoal,
    this.secondHalfGoal,
  });

  void addFirstHalfCount(int count) {
    firstHalfCount = count;
  }

  void addSecondHalfCount(int count) {
    secondHalfCount = count;
  }

  void addFirstHalfGoal(int goal) {
    firstHalfGoal = goal;
  }

  void addSecondHalfGoal(int goal) {
    secondHalfGoal = goal;
  }
}

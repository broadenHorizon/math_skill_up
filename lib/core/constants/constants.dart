import 'package:hive/hive.dart';

part 'constants.g.dart';

@HiveType(typeId: 0)
enum QuestionType {
  @HiveField(0)
  basic,
  @HiveField(1)
  fraction,
  @HiveField(2)
  alphabet,
}

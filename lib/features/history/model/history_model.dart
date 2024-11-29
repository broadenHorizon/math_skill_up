import 'package:hive/hive.dart';
import 'package:math_skill_up/core/constants/constants.dart';

part 'history_model.g.dart';

@HiveType(typeId: 1)
class History {
  @HiveField(0)
  final DateTime date;
  @HiveField(1) // 날짜 (년월일)
  final QuestionType questionType; // 문제 유형
  @HiveField(2)
  final int elapsedTime; // 걸린 시간 (milliseconds)
  @HiveField(3)
  final double accuracy; // 정답률 (0.00 ~ 1.00)

  History({
    required this.date,
    required this.questionType,
    required this.elapsedTime,
    required this.accuracy,
  });

  // accuracy을 0.00%로 반환하는 메서드
  String get formattedAccuracy {
    return "${(accuracy * 100).toStringAsFixed(2)}%";
  }

  // elapsedTime을 "00분 00.00초"로 포맷하는 메서드
  String get formattedElapsedTime {
    int minutes = elapsedTime ~/ 60000; // 분
    double seconds = (elapsedTime % 60000) / 1000.0; // 초
    return "${minutes.toString().padLeft(2, '0')}분 ${seconds.toStringAsFixed(2).padLeft(5, '0')}초";
  }

  // date를 "yyyy-mm-dd"로 포맷하는 메서드
  String get formattedDate {
    String year = date.year.toString();
    String month = date.month.toString().padLeft(2, '0'); // 월 두 자리
    String day = date.day.toString().padLeft(2, '0'); // 일 두 자리
    return "$year-$month-$day";
  }
}

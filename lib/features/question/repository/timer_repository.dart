import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer_repository.g.dart';

@riverpod
class TimerRepository extends _$TimerRepository {
  late double time;
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  @override
  double build() {
    time = 0;
    return time;
  }

  void startTimer() {
    time = 0;
    _stopwatch.start();

    // 주기적으로 time 상태를 업데이트하는 Timer 설정
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      time = double.parse((_stopwatch.elapsedMilliseconds.toDouble() / 1000)
          .toStringAsFixed(1)); // 소수점 한자리로 변환
      state = time; // 상태 업데이트
    });
  }

  double stopTimer() {
    _stopwatch.stop();
    _timer?.cancel();
    time = double.parse((_stopwatch.elapsedMilliseconds.toDouble() / 1000)
        .toStringAsFixed(1)); // 소수점 한자리로 변환
    state = 0;
    _stopwatch.reset();
    return time;
  }
}

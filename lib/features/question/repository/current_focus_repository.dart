import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_focus_repository.g.dart';

@riverpod
class CurrentFocusRepository extends _$CurrentFocusRepository {
  @override
  String? build() {
    return null;
  }

  void setFocus(String? currentFocus) {
    print(currentFocus);
    state = currentFocus; // 상태 업데이트
  }
}

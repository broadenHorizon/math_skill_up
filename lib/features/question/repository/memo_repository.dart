import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'memo_repository.g.dart';

@riverpod
class MemoRepository extends _$MemoRepository {
  @override
  String build() {
    return "";
  }

  void setMemo(String memo) {
    state = memo; // 상태 업데이트
  }

  String getMemo() {
    return state;
  }
}

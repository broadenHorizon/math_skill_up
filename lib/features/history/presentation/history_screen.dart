import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/constants/constants.dart';
import 'package:math_skill_up/features/history/model/history_model.dart';
import 'package:math_skill_up/features/history/repository/hive_history_repository.dart';

// TODO: 임시로 history 저장 및 조회 로직을 넣었고, 차후 수정 예정

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  late final TextEditingController _elapsedTimeController;
  late final TextEditingController _accuracyController;

  @override
  void initState() {
    super.initState();
    _elapsedTimeController = TextEditingController();
    _accuracyController = TextEditingController();
  }

  @override
  void dispose() {
    _elapsedTimeController.dispose();
    _accuracyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final historyRepository = ref.watch(hiveHistoryRepositoryProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('History Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _elapsedTimeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Elapsed Time (milliseconds)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _accuracyController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Accuracy (0.00 - 1.00)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                // 입력값으로 새로운 History 저장
                final elapsedTime =
                    int.tryParse(_elapsedTimeController.text) ?? 0;
                final accuracy =
                    double.tryParse(_accuracyController.text) ?? 0.0;

                final newHistory = History(
                  date: DateTime.now(),
                  questionType: QuestionType.basic, // 기본 문제 유형으로 고정
                  elapsedTime: elapsedTime,
                  accuracy: accuracy,
                );

                await historyRepository.addHistory(newHistory);

                // 입력 필드 초기화
                _elapsedTimeController.clear();
                _accuracyController.clear();

                // 화면 갱신
                setState(() {});
              },
              child: const Text('Add History'),
            ),
            const SizedBox(height: 20),
            const Text(
              'History List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<History>>(
                future: historyRepository.build(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  final histories = snapshot.data ?? [];

                  if (histories.isEmpty) {
                    return const Center(child: Text('No history found.'));
                  }

                  return ListView.builder(
                    itemCount: histories.length,
                    itemBuilder: (context, index) {
                      final history = histories[index];
                      return ListTile(
                        title: Text("Date: ${history.formattedDate}"),
                        subtitle: Text(
                            "Accuracy: ${history.formattedAccuracy}, Time: ${history.formattedElapsedTime}"),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
